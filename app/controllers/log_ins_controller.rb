class LogInsController < ApplicationController
  def create
    user = Customer.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      cookies[:user_id] = user.id
      redirect_to products_path
    else
      redirect_to log_in_path, alert: 'Log In Failed'
    end
  end
end