class QuestionCommentVote < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :user
  belongs_to :question_comment

  enum choice: { up_vote: 1, down_vote: -1, cancel: 0 }

  after_update_commit do
    broadcast_replace_to :question_comments,
      target: dom_id(question_comment),
      partial: "question_comments/question_comment",
      locals: { question_comment: question_comment }
  end
end
