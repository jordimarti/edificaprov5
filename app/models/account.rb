class Account < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :account_affiliations
  has_many :users, through: :account_affiliations
  has_many :channels

  validates :name, presence: true
end
