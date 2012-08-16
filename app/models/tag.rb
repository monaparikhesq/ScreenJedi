class Tag < ActiveRecord::Base
  attr_accessible :keyword
  
  has_many :tagging
  has_many :screencast
  has_many :user
  
end
