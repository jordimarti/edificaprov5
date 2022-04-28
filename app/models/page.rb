class Page < ApplicationRecord
  belongs_to :parent, class_name: "Page"
  belongs_to :article

  acts_as_list scope: :parent
  has_many :children, class_name: "Page", foreign_key: "parent_id"
end
