class AddUidToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :uid, :string
  end
end
