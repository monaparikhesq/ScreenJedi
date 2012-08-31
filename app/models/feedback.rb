class Feedback < ActiveRecord::Base
  attr_accessible :comment, :email
  
  validates_presence_of :email
end
