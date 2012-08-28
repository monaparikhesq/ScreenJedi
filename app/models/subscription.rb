class Subscription < ActiveRecord::Base
  attr_accessible :screencast_id, :user_id
  
  belongs_to :screencast
  belongs_to :user
  
  validates_uniqueness_of :user_id, :scope => :screencast_id
end
