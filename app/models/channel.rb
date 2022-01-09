class Channel < ApplicationRecord
  extend FriendlyId
  friendly_id :publicid, use: :slugged
  
  belongs_to :account
  has_many :channel_affiliations
  has_many :users, through: :channel_affiliations
  has_many :videos
  has_many :articles
  #has_many :courses
  #has_many :communities

  validates :name, presence: true
end
