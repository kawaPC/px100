class Album < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  # アルバムの並びを新しい順に
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :album_name, presence: true, length: { maximum: 30 }
end
