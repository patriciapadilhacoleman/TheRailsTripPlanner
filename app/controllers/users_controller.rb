class UsersController < ApplicationController
  # before_action :require_logged_in
  # before_action :user_is_admin
  def new

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

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
