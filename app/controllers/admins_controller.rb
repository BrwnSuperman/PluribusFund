class Admins::SessionsController < Devise::SessionsController

  before_filter :authenticate_admin!

end