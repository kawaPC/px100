class Post < ApplicationRecord
  belongs_to :user
  belongs_to :album
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validate  :picture_size
  
  private
  # アップロードされた画像のサイズをバリデーションする
  def picture_size
    if picture.size > 3.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
