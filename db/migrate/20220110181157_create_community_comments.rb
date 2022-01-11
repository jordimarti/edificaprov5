class CreateCommunityComments < ActiveRecord::Migration[7.0]
  def change
    create_table :community_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true

      t.timestamps
    end
  end
end
