class User < ActiveRecord::Base
  attr_accessible :insta_id

  has_many :assignments
  has_many :projects, through: :assignments
  has_many :videos

  validates :insta_id, uniqueness: true;
end
