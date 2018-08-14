class Album < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  # アルバムの並びを新しい順に
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :album_name, presence: true, length: { maximum: 30 }
  mount_uploader :cover_picture, PictureUploader
  validate  :cover_picture_size
  # ユーザー内でアルバム名を一意に
  validates :album_name,
  uniqueness: {scope: :user_id, case_sensitive: false},
  format: { with: /\A[A-Za-z][\w-]*\z/ },
  length: { minimum: 3, maximum: 25 },
  ban_reserved: true
  
  
  def to_param
    album_name
  end
  
  private
  # アップロードされた画像のサイズをバリデーションする
  def cover_picture_size
    if cover_picture.size > 3.megabytes
      errors.add(:cover_picture, "should be less than 5MB")
    end
  end
end
