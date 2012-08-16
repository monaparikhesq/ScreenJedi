class Screencast < ActiveRecord::Base
  attr_accessible :description, :embed, :length, :title
  
  has_many :note
  has_many :rating
  has_many :tag, :through => :tagging
  has_many :tagging
  has_many :subscription
end
