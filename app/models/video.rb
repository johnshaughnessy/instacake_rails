class Video < ActiveRecord::Base
  attr_accessible :created_at, :uid, :thumbnail, :vid_uri
  
  has_many :vp_assignments
  has_many :projects, through: :vp_assignments
  belongs_to :user

  validates :uid, uniqueness: true;
end
