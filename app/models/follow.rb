class Follow < ActiveRecord::Base
  attr_accessible :followed_id, :follower_id
  
  belongs_to :follower_user, :class_name => 'User', :foreign_key => 'follower_id'
  belongs_to :followed_user, :class_name => 'User', :foreign_key => 'followed_id'
end
