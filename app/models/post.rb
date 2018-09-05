class Post < ApplicationRecord
  belongs_to :user
  belongs_to :album

  default_scope -> {order(created_at: :desc)}

  validates :user_id, presence: true
  validate :picture_size

  mount_uploader :picture, PictureUploader

  private

  # アップロードされた画像のサイズをバリデーションする
  def picture_size
    if picture.size > 3.megabytes
      errors.add(:picture, "3MB以上の画像は投稿できません")
    end
  end
end
