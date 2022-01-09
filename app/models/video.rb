class Video < ApplicationRecord
  extend FriendlyId
  friendly_id :publicid, use: :slugged
  
  belongs_to :channel
end
