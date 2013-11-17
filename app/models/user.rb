class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  has_many :password_resets

  validates_presence_of :name, :email

  has_secure_password validations: false

  def sign_in
    default_params.permit(:username, :email)
  end

end
