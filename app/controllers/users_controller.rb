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

  private
  def create_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
