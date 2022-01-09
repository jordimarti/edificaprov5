class Video < ApplicationRecord
  extend FriendlyId
  friendly_id :publicid, use: :slugged
  
  belongs_to :channel
  validates :title, presence: true
  has_one_attached :file
end
