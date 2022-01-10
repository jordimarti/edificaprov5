class VideoComment < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :user
  belongs_to :video

  has_many :video_comment_votes, dependent: :destroy

  has_rich_text :content

  after_create_commit do
    video = Video.find(self.video_id)
    broadcast_append_to :video_comments, target: "comments_#{dom_id(video)}", partial: "video_comments/video_comment", locals: { video_comment: self }
  end
  
  def video_comment_vote_count
    video_comment_votes.sum(:choice)
  end
end
