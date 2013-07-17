class RemoveUrisFromProject < ActiveRecord::Migration
  def up
    remove_column :projects, :insta_thumb_uri
    remove_column :projects, :insta_vid_uri
    remove_column :projects, :local_thumb_uri
    remove_column :projects, :local_vid_uri
  end

  def down
  end
end
