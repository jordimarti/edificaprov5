class CommunityCommentVotesController < ApplicationController
  before_action :authenticate_user!

  def show
    @community_comment = CommunityComment.find(params[:community_comment_id])
    @community_comment_vote = CommunityCommentVote.find_or_create_by(user: current_user, community_comment: @community_comment)

    case params[:choice]
    when "up_vote"
      @community_comment_vote.up_vote? ? @community_comment_vote.cancel! : @community_comment_vote.up_vote!
    when "down_vote"
      @community_comment_vote.down_vote? ? @community_comment_vote.cancel! : @community_comment_vote.down_vote!
    end
  end
end