class ArticleCommentVotesController < ApplicationController
  before_action :authenticate_user!

  def show
    @article_comment = ArticleComment.find(params[:article_comment_id])
    @article_comment_vote = ArticleCommentVote.find_or_create_by(user: current_user, article_comment: @article_comment)

    case params[:choice]
    when "up_vote"
      @article_comment_vote.up_vote? ? @article_comment_vote.cancel! : @article_comment_vote.up_vote!
    when "down_vote"
      @article_comment_vote.down_vote? ? @article_comment_vote.cancel! : @article_comment_vote.down_vote!
    end
  end
end