class User < ApplicationRecord
  before_create :generate_friendly_id
  # ユーザーが削除されたときにアルバム・写真も削除されるように
  has_many :albums, dependent: :destroy
  has_many :posts, dependent: :destroy
  validates :name, presence: true
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
                          friendly_id: auth.set_random_name,
                          password: Devise.friendly_token[0,20] )
    end
    return user
  end
  
  def to_param
    friendly_id
  end
  
  def set_random_name
    friendly_id = SecureRandom.hex(10)
    while User.where(friendly_id: friendly_id).exists?
        friendly_id = SecureRandom.hex(10)
    end
    return friendly_id
  end
  
  def generate_friendly_id
    self.friendly_id = self.set_random_name
  end
  
end
