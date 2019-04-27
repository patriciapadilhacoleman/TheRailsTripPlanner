class UsersController < ApplicationController
  # before_action :require_logged_in
  # before_action :user_is_admin
  def new

  end

  def create
    @user = User.create(user_params)
    binding.pry
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'home'
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation,:first_name, :last_name, :email, :phone, :home_airport, :street_address, :city, :state, :zip)
  end

  def user_is_admin

  end
end
