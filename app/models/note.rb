class Note < ActiveRecord::Base
  attr_accessible :body, :screencast_id, :user_id
end
