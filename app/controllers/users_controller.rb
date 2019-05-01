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

    @user = User.new(user_params)

    if @user.save

      session[:user_id] = @user.id
      redirect_to controller: 'trips', action: 'index'
    else
      render :new
    end

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)

      redirect_to users_url
    else
      render :edit
    end
  end

  def destroy

    @user = User.find(params[:id]).destroy
    flash[:notice] = "User deleted."
    session[:user_id] = nil
    redirect_to login_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation,:first_name, :last_name, :email, :phone, :home_airport, :street_address, :city, :state, :zip)
  end

  def user_is_admin

  end


end
