class AddUsernameToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :username, :string
    add_column :accounts, :category, :string
  end
end
