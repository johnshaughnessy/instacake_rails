class RemoveInstaIdFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :insta_id
  end

  def down
    add_column :users, :insta_id, :string
  end
end
