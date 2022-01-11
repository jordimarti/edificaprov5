class CommunityComment < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :user
  belongs_to :community

  has_many :community_comment_votes, dependent: :destroy

  has_rich_text :content

  after_create_commit do
    community = Community.find(self.community_id)
    broadcast_append_to :community_comments, target: "comments_#{dom_id(community)}", partial: "community_comments/community_comment", locals: { community_comment: self }
  end
  
  def community_comment_vote_count
    community_comment_votes.sum(:choice)
  end
end
