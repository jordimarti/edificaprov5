class CreateCommunities < ActiveRecord::Migration[7.0]
  def change
    create_table :communities do |t|
      t.references :channel, null: false, foreign_key: true
      t.string :name
      t.string :privacy
      t.string :publicid

      t.timestamps
    end
  end
end
