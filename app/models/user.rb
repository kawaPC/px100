class User < ApplicationRecord
  before_create :generate_friendly_id

  has_many :albums, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :friendly_id,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[A-Za-z][\w-]*\z/ },
            length: { minimum: 3, maximum: 25 },
            allow_nil: true,
            ban_reserved: true,
            presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]

  def self.from_omniauth(auth)
    User.find_or_create_by(uid: auth['uid']) do |user|
      user.name = auth.extra.raw_info.name
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.token = auth.credentials.token
      user.password = Devise.friendly_token[0, 20]
    end
  end

  # UserルートにはidではなくフレンドリーなURLを設定できるように
  def to_param
    friendly_id
  end

  # 登録時はユーザーページ用のURLをランダムに付与する
  def generate_friendly_id
    random_id = SecureRandom.hex(10)
    while User.exists?(friendly_id: random_id)
      random_id = SecureRandom.hex(10)
    end
    self.friendly_id = random_id
  end


  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
