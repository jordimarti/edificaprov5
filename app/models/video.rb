class Video < ApplicationRecord
  extend FriendlyId
  friendly_id :publicid, use: :slugged
  
  belongs_to :channel
  validates :title, presence: true
  has_one_attached :file
  has_one_attached :thumbnail
  has_many :video_comments, dependent: :destroy
  has_rich_text :description

  enum privacy: [:draft, :course, :open]
end
