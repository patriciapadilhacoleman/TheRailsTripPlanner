class SessionsController < ApplicationController
  def new

  end

  def create

    if params[:provider]
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to root_url

    else
      user = User.find_by(username: params[:user][:username])
      user = user.try(:authenticate, params[:user][:password])
      binding.pry
      return redirect_to(controller: 'sessions', action: 'new') unless user
      session[:user_id] = user.id
      @user = user
      redirect_to controller: 'trips', action: 'index'
    end

  end


  def destroy
    session.delete :user_id

    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
