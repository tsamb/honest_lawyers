class SessionsController < ApplicationController
  def new

  end

  def create

    @user = User.find_by(email: params[:session][:email])
    puts @user
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end

  end

  def destroy
    #logout page
    #clear session
  end

  private
  def create_params
    params.require(:user).permit(:email, :password)
  end

end
