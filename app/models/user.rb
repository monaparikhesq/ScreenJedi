class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  
  has_many :note
  has_many :rating
  has_many :subscription
  has_many :tag, :through => :subscription
end
