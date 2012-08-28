class MembersController < ApplicationController

	def index

		@company_id = Company.find(Membership.find_by_user_id(session[:user_id]).company_id)

		@user = User.find(session[:user_id])

		@members = array_of_members_by_company_id(@company_id)
	
	end

end