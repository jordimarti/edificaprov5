class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.references :course, null: false, foreign_key: true
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
