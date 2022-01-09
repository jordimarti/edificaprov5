class CreateChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :channels do |t|
      t.references :account, null: false, foreign_key: true
      t.string :name
      t.string :privacy
      t.integer :subscribers
      t.string :main_community

      t.timestamps
    end
  end
end
