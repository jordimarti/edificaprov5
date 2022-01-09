class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.references :channel, null: false, foreign_key: true
      t.string :title
      t.integer :score

      t.timestamps
    end
  end
end
