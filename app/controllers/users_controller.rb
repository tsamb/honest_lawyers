class UsersController < ApplicationController
  def index
    redirect_to user_path(current_user)
  end

  def new
    #displays new user form, new.html.erb
    @user = User.new
  end

  def create
    #takes info from new user form, validates user, generates user, redirects to show
    #sets current_user= new created user

    @user = User.new(create_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render new_user_path
    end
  end

  def show
    @user = current_user
    @matters = @user.matters.order('updated_at DESC').limit(5)
  end

  private
  def create_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

end
