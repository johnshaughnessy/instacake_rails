class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :insta_vid_uri
      t.string :insta_thumb_uri
      t.string :local_vid_uri
      t.string :local_thumb_uri
      t.string :title

      t.timestamps
    end
  end
end
