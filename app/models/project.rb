class Project < ActiveRecord::Base
  attr_accessible :insta_thumb_uri, :insta_vid_uri, 
  :local_thumb_uri, :local_vid_uri, :title

  has_many :assignments
  has_many :users, through: :assignments
end
