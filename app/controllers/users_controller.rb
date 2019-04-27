class UsersController < ApplicationController
  before_action :require_logged_in
  before_action :user_is_admin
  def new

  end

  def create
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'home'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def user_is_admin

  end
end
