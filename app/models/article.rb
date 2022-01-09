class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_rich_text :content
  
  belongs_to :channel

  validates :title, presence: true
end
