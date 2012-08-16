class Subscription < ActiveRecord::Base
  attr_accessible :screencast_id, :user_id
  
  belongs_to :screencast
  belongs_to :user
end
