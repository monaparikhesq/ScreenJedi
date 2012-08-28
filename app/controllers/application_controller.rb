class ApplicationController < ActionController::Base
  protect_from_forgery

  def array_of_members_by_company_id(company_id)

	memberships = Membership.find_all_by_company_id(company_id)

	users = []
	memberships.each do |membership|
		users.push(User.find_all_by_id(membership.user_id))
	end

	return users

end

end
