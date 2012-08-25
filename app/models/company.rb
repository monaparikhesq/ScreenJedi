class Company < ActiveRecord::Base
	attr_accessible :name

	has_many :membership
	has_many :users, :through => :memberships


end
