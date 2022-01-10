class CreateVideoComments < ActiveRecord::Migration[7.0]
  def change
    create_table :video_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :video, null: false, foreign_key: true

      t.timestamps
    end
  end
end
