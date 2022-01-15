class LibraryFolder < ApplicationRecord
  belongs_to :channel
  has_many :library_items
end
