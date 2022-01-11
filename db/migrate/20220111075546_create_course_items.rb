class CreateCourseItems < ActiveRecord::Migration[7.0]
  def change
    create_table :course_items do |t|
      t.references :course, null: false, foreign_key: true
      t.string :name
      t.string :category
      t.integer :position

      t.timestamps
    end
  end
end
