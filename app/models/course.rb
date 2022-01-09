class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :channel
  validates :title, presence: true
end
