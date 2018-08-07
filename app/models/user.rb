class User < ApplicationRecord
  # ユーザーが削除されたときにアルバム・写真も削除されるように
  has_many :albums, dependent: :destroy
  has_many :posts, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :friendly_id, 
  uniqueness: { case_sensitive: false },
  format: { with: /\A[A-Za-z][\w-]*\z/ },
  length: { minimum: 3, maximum: 25 },
  allow_nil: true,
  ban_reserved: true
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]
         
  def self.from_omniauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      user = User.create( name:     auth.extra.raw_info.name,
                          provider: auth.provider,
                          uid:      auth.uid,
                          email:    auth.info.email,
                          token:    auth.credentials.token,
                          password: Devise.friendly_token[0,20] )
    end
    return user
  end
  
  def to_param
    friendly_id ? friendly_id : id.to_s
  end
  
  def self.find_by_friendly_id_or_id(arg)
    find_by_friendly_id(arg) || find(arg)
  end
end
