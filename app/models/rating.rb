class Rating < ActiveRecord::Base
  attr_accessible :opinion, :screencast_id, :user_id
end
