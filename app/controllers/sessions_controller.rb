class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_url(user), :notice => "Signed in as #{:email}."
      else
        redirect_to users_url, :notice => 'Wrong Password.'
      end
    else
      redirect_to root_url, :notice => 'Wrong email.'
    end
  end
  
  def destroy
    reset_session
    redirect_to root_url, :notice => 'Sign-out successful.'
  end
  
end
