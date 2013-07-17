class AddVideoIdToVpAssignments < ActiveRecord::Migration
  def change
    add_column :vp_assignments, :video_id, :integer
  end
end
