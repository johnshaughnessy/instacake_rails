class Video < ActiveRecord::Base
  attr_accessible :created_at, :insta_id
  
  has_many :vp_assignments
  has_many :projects, through: :vp_assignments
  belongs_to :user

  validates :insta_id, uniqueness: true;
end
