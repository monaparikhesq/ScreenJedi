class Member < ActiveRecord::Base

def array_of_members_by_company_id(company_id)

	memberships = Membership.find_all_by_company_id(company_id)

	memberships.each do |membership|
		users = User.find_all_by_user_id(membership.user_id)
	end

	return users

end


end