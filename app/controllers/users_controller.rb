class UsersController < ApplicationController
  # before_action :require_logged_in
  # before_action :user_is_admin

  def new

  end

  def index

    @user = current_user
    render :show

  end

  def show
    @user = current_user
  end

  def create
    @user = User.create(user_params)

    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'trips', action: 'index'
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation,:first_name, :last_name, :email, :phone, :home_airport, :street_address, :city, :state, :zip)
  end

  def user_is_admin

  end


end
