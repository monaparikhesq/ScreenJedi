class Company < ActiveRecord::Base
	attr_accessible :name

	has_many :memberships
	has_many :users, :through => :memberships
  has_many :screencasts

end
