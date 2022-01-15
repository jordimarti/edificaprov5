class CreateLibraryFolders < ActiveRecord::Migration[7.0]
  def change
    create_table :library_folders do |t|
      t.references :channel, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
