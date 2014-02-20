class UsersController < ApplicationController
  def new
    #displays new user form, new.html.erb
    @user = User.new
  end

  def create
    #takes info from new user form, validates user, generates user, redirects to show
    #sets current_user= new created user

    @user = User.new(create_params)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    #user profile page
    #calls some kind of #recent_matters helper so show.html.erb can list recent matters
    #calls some kind of #current_task? helper
    #    helper will check if there is an open task
    #    helper will define necessary time variables if there is an open task


    #redirect_to root_path unless params[:id] != current_user.id
    @user = User.find(params[:id])
    @matters = @user.matters.order('updated_at DESC').limit(5)
  end

  private
  def create_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

end
