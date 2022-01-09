class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.references :channel, null: false, foreign_key: true
      t.string :title
      t.integer :score
      t.boolean :visible
      t.string :publicid
      t.string :playback_id
      t.string :policy
      t.string :mux_asset_id
      t.string :status
      t.string :max_stored_resolution
      t.float :max_stored_frame_rate
      t.float :duration
      t.string :aspect_ratio

      t.timestamps
    end
  end
end
