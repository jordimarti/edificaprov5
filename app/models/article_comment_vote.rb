class ArticleCommentVote < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :user
  belongs_to :article_comment

  enum choice: { up_vote: 1, down_vote: -1, cancel: 0 }

  after_update_commit do
    broadcast_replace_to :article_comments,
      target: dom_id(article_comment),
      partial: "article_comments/article_comment",
      locals: { article_comment: article_comment }
  end
end
