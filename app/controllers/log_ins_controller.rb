class LogInsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      cookies[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to log_in_path, alert: 'Log In Failed'
    end
  end
end