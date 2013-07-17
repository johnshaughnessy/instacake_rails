class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :insta_id
      t.string :created_at

      t.timestamps
    end
  end
end
