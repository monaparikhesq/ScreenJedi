class Membership < ActiveRecord::Base
	attr_accessible :user_id, :company_id

	belongs_to :user_id
	belongs_to :company_id
end