class SessionsController < ApplicationController
  def new
  end

  def create

    @user = User.find_by(email: params[:session][:email].downcase)
    puts @user
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      render user_path(@user)
    else
      flash[:signin_error] = "Invalid Email or Password. Please try again."
      redirect_to new_session_path
    end

  end

  def destroy
    # sign_out
    # implement sign_out in session helper???
    session.clear
    redirect_to root_path
  end

  private
  def create_params
    params.require(:user).permit(:email, :password)
  end

end
