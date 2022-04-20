class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :channel
  has_many :lessons
  has_many :course_items, -> { order(position: :asc) }, dependent: :destroy

  validates :title, presence: true
  has_one_attached :thumbnail

  enum privacy: [:draft, :open]
end
