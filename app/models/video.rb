class Video < ActiveRecord::Base
  attr_accessible :created_at, :insta_id

  belongs_to :user
end
