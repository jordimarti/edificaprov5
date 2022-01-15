class CreateLibraryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :library_items do |t|
      t.references :library_folder, null: false, foreign_key: true
      t.string :category
      t.integer :itemid

      t.timestamps
    end
  end
end
