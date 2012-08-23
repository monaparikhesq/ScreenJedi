class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  
  validates_uniqueness_of :email
  
  has_secure_password
  
  has_many :notes
  has_many :ratings
  has_many :subscriptions
  has_many :tags, :through => :subscriptions
end
