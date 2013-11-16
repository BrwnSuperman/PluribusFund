class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


  protected
  def require_log_in
    redirect_to '/log_in' unless logged_in?
  end

  helper_method :logged_in?
  def logged_in?
    cookies.signed[:customer_id].present?
  end

  helper_method :cart_item_count
  def cart_item_count
    if session[:cart]
      session[:cart].values.sum
    else
      0
    end
  end

  protect_from_forgery with: :exception
end
