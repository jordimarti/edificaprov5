class VideoCommentVotesController < ApplicationController
  before_action :authenticate_user!

  def show
    @video_comment = VideoComment.find(params[:video_comment_id])
    @video_comment_vote = VideoCommentVote.find_or_create_by(user: current_user, video_comment: @video_comment)

    case params[:choice]
    when "up_vote"
      @video_comment_vote.up_vote? ? @video_comment_vote.cancel! : @video_comment_vote.up_vote!
    when "down_vote"
      @video_comment_vote.down_vote? ? @video_comment_vote.cancel! : @video_comment_vote.down_vote!
    end
  end
end