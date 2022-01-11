class CreateQuestionCommentVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :question_comment_votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :question_comment, null: false, foreign_key: true
      t.integer :choice

      t.timestamps
    end
  end
end
