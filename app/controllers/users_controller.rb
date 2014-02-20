class UsersController < ApplicationController
  def new
    #displays new user form, new.html.erb
  end

  def create
    #takes info from new user form, validates user, generates user, redirects to show
    #sets current_user= new created user
  end

  def show
    #user profile page
    #calls some kind of #recent_matters helper so show.html.erb can list recent matters
    #calls some kind of #current_task? helper
    #    helper will check if there is an open task
    #    helper will define necessary time variables if there is an open task
  end
end