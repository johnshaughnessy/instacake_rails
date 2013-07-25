class AddVidUriToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :vid_uri, :string
  end
end
