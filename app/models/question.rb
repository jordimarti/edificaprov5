class Question < ApplicationRecord
  belongs_to :user

  has_many :question_comments, dependent: :destroy
end
