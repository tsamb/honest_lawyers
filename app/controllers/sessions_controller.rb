class SessionsController < ApplicationController
  def new

  end

  def create

     @user = User.find_by(email: params[:session][:email].downcase)
     #render text: @user.matters.first.description

    if @user.authenticate(params[:session][:password])
       session[:user_id] = @user.id
       redirect_to user_path(@user)

     else
      render text: "error can't login"
    #   flash[:signin_error] = "Post successfully created"
    #   redirect_to new_session_path
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
