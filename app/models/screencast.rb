class Screencast < ActiveRecord::Base
  attr_accessible :description, :embed, :length, :title
  
  has_many :notes
  has_many :ratings
  has_many :tags, :through => :taggings
  has_many :taggings
  has_many :subscriptions
end
