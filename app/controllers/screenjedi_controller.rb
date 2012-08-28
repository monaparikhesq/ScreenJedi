class ScreenjediController < ApplicationController

  def index
  end
  
  def welcome
    if session[:user_id]
      redirect_to user_url(session[:user_id])
    end
  end
  
end