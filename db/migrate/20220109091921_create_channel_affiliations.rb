class CreateChannelAffiliations < ActiveRecord::Migration[7.0]
  def change
    create_table :channel_affiliations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :channel, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
