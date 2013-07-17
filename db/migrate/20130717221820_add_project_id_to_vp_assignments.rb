class AddProjectIdToVpAssignments < ActiveRecord::Migration
  def change
    add_column :vp_assignments, :project_id, :integer
  end
end
