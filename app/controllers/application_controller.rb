class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def array_of_members_by_company_id(company_id)

	  memberships = Membership.find_all_by_company_id(company_id)

  	users = []
  	memberships.each do |membership|
  		users.push(User.find_all_by_id(membership.user_id))
  	end

  	return users

  end
  
 
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])  
  end

end
