module SessionsHelper

  # def sign_in(user)
  #   remember_token = User.new_remember_token
  #   cookies.permanent[:remember_token] = remember_token
  #   user.update_attribute(:remember_token, User.encrypt(remember_token))
  #   self.current_user = user
  # end

  def sign_out
    # current_user.update_attribute(:remember_token,
    #                               User.encrypt(User.new_remember_token))
    # cookies.delete(:remember_token)
    # self.current_user = nil
    session.clear
  end
end
