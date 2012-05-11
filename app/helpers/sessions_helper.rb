module SessionsHelper
  def sign_in(user)
    cookies[:remember_token] = {value: user.remember_token, expires: 5.weeks.from_now.utc}
    current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end
  def current_user
    @current_user ||= user_from_remember_token
  end
  def current_user?(user)
    user == current_user
  end
  
  
  def signed_in?
    !current_user.nil?
  end
  def sign_out
    current_user= nil
    basket = current_basket
    basket.destroy
    session[:basket_id] = nil
    cookies.delete(:remember_token)  
  end
  
  
  private
    def user_from_remember_token
      remember_token = cookies[:remember_token]
      User.find_by_remember_token(remember_token)
    end
end
