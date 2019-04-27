class ApplicationController < ActionController::Base
  

  def require_logged_in
    if !session[:user_id]
      redirect_to login_path
    end
  end

  def  current_user
    @user ||= User.find(session[:user_id])
  end
end
