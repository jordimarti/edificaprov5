class AddPrivacyToVideos < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :privacy, :integer
  end
end
