class Project < ActiveRecord::Base
  attr_accessible :title

  has_many :assignments
  has_many :users, through: :assignments
  has_many :videos, through: :vp_assignments
end
