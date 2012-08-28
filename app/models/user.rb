class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :company_id, :admin
  
  validates_uniqueness_of :email
  
  has_secure_password
  
  has_many :notes
  has_many :ratings
  has_many :subscriptions
  has_many :tags, :through => :subscriptions
  has_one :membership
  has_one :company, :through => :membership
  has_many :followers, :class_name => 'Follow', :foreign_key => 'follower_id'
  has_many :followeds, :class_name => 'Follow', :foreign_key => 'followed_id'
end
