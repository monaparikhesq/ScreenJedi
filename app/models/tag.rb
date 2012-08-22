class Tag < ActiveRecord::Base
  attr_accessible :keyword
  
  has_many :taggings
  has_many :screencasts
  has_many :users
  
end
