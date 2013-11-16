class UsersController < ApplicationController
  skip_before_filter :require_log_in, only: [:new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to log_in_path, notice: 'Your account was created, please log in'
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password) if params[:user]
  end
end
