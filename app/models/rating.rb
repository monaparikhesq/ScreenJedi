class Rating < ActiveRecord::Base
  attr_accessible :opinion, :screencast_id, :user_id
  
  belongs_to :screencast
  belongs_to :user
end
