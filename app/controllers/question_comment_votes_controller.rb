class QuestionCommentVotesController < ApplicationController
  before_action :authenticate_user!

  def show
    @question_comment = QuestionComment.find(params[:question_comment_id])
    @question_comment_vote = QuestionCommentVote.find_or_create_by(user: current_user, question_comment: @question_comment)

    case params[:choice]
    when "up_vote"
      @question_comment_vote.up_vote? ? @question_comment_vote.cancel! : @question_comment_vote.up_vote!
    when "down_vote"
      @question_comment_vote.down_vote? ? @question_comment_vote.cancel! : @question_comment_vote.down_vote!
    end
  end
end