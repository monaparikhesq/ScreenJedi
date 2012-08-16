class Tagging < ActiveRecord::Base
  attr_accessible :screencast_id, :tag_id
  
  belongs_to :tag
  belongs_to :screencast
end
