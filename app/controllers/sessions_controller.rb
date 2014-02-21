class SessionsController < ApplicationController
  def new
  end

  def create

    user = User.find_by(email: params[:session][:email].downcase)

    if user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:signin_error] = "Invalid Email or Password. Please try again."
      redirect_to new_session_path
    end

  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
  def create_params
    params.require(:user).permit(:email, :password)
  end

end
