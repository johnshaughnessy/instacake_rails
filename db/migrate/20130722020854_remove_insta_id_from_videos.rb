class RemoveInstaIdFromVideos < ActiveRecord::Migration
  def up
    remove_column :videos, :insta_id
  end

  def down
    add_column :videos, :insta_id, :string
  end
end
