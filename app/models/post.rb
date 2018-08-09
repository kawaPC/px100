class Post < ApplicationRecord
  belongs_to :user
  belongs_to :album
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  # mount_uploader :picture, PictureUploader
end
