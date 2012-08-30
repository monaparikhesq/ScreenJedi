class Membership < ActiveRecord::Base
	attr_accessible :user_id, :company_id

	belongs_to :user
	belongs_to :company
	
	validates :user_id, :company_id, :presence => true
	
end