class CommunityCommentVote < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :user
  belongs_to :article_comment

  enum choice: { up_vote: 1, down_vote: -1, cancel: 0 }

  after_update_commit do
    broadcast_replace_to :community_comments,
      target: dom_id(community_comment),
      partial: "community_comments/community_comment",
      locals: { community_comment: community_comment }
  end
end
