class CreateArticleCommentVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :article_comment_votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :article_comment, null: false, foreign_key: true
      t.integer :choice, limit: 1, default: 0

      t.timestamps
    end
  end
end
