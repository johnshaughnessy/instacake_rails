class User < ActiveRecord::Base
  attr_accessible :uid, :username

  has_many :assignments
  has_many :projects, through: :assignments
  has_many :videos

  validates :uid, uniqueness: true;
end
