class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  has_many :password_resets

  validates :username,	presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :email,			presence: true, uniqueness: { case_sensitive: false }

  def sign_in
    default_params.permit(:username, :email)
  end

end
