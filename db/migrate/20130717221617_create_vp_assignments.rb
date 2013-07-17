class CreateVpAssignments < ActiveRecord::Migration
  def change
    create_table :vp_assignments do |t|

      t.timestamps
    end
  end
end
