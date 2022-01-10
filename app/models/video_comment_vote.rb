class VideoCommentVote < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :user
  belongs_to :video_comment

  enum choice: { up_vote: 1, down_vote: -1, cancel: 0 }

  after_update_commit do
    broadcast_replace_to :video_comments,
      target: dom_id(video_comment),
      partial: "video_comments/video_comment",
      locals: { video_comment: video_comment }
  end
end
