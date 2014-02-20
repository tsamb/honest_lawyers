class SessionController < ApplicationController
  def new
    #login page
  end

  def create
    #where directed to from login page
    #authenticates
    #sets session[:user_id] if authentication suceeds
    #redirects to user_path(user) if authentication succeeds
    #redirects to new_session_path if fails
  end

  def destroy
    #logout page
    #clear session

end