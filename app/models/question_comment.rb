class QuestionComment < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :user
  belongs_to :question

  has_many :question_comment_votes, dependent: :destroy

  has_rich_text :content

  after_create_commit do
    question = Question.find(self.question_id)
    broadcast_append_to :question_comments, target: "comments_#{dom_id(question)}", partial: "question_comments/question_comment", locals: { question_comment: self }
  end
  
  def question_comment_vote_count
    question_comment_votes.sum(:choice)
  end
end
