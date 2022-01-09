class Community < ApplicationRecord
  extend FriendlyId
  friendly_id :publicid, use: :slugged
  
  belongs_to :channel
  has_many :community_affiliations
  has_many :users, through: :community_affiliations
end
