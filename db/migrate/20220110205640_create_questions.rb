class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
