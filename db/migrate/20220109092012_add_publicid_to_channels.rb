class AddPublicidToChannels < ActiveRecord::Migration[7.0]
  def change
    add_column :channels, :publicid, :string
  end
end
