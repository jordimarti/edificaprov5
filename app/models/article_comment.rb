class ArticleComment < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :user
  belongs_to :article

  has_many :article_comment_votes, dependent: :destroy

  has_rich_text :content

  after_create_commit do
    article = Article.find(self.article_id)
    broadcast_append_to :article_comments, target: "comments_#{dom_id(article)}", partial: "article_comments/article_comment", locals: { article_comment: self }
  end
  
  def article_comment_vote_count
    article_comment_votes.sum(:choice)
  end
end
