class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_cors_headers
  
  def set_cors_headers
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, X-Requested-With'
  end
  

  def authenticate_user!
    super
    if user_signed_in? && current_user.role != 0
      sign_out current_user
      flash[:alert] = "Bạn không có quyền truy cập."
      redirect_to new_user_session_path
    end
  end

end
