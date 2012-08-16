class Note < ActiveRecord::Base
  attr_accessible :body, :screencast_id, :user_id
  
  belongs_to :screencast
  belongs_to :user
end
