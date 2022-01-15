class AddLibraryPrivacyToChannel < ActiveRecord::Migration[7.0]
  def change
    add_column :channels, :library_privacy, :string, default: "private"
  end
end
