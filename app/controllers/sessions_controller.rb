class SessionsController < ApplicationController
  def new

  end

  def create

    if params[:provider]
      user = User.create_with_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to controller: 'trips', action: 'index'

    else

      binding.pry
      user = User.find_by(username: params[:user][:username])
      user = user.try(:authenticate, params[:user][:password])

      return redirect_to(controller: 'sessions', action: 'new') unless user
      session[:user_id] = user.id
      @user = user
      redirect_to controller: 'trips', action: 'index'
    end

  end


  def destroy

    session[:user_id] = nil
    redirect_to login_url
  end

  private

  

end
