class SessionsController < ApplicationController
  def new

  end

  def create


    user = User.find_by(username: params[:user][:username])


    user = user.try(:authenticate, params[:user][:password])

    return redirect_to(controller: 'sessions', action: 'new') unless user

    session[:user_id] = user.id

    @user = user

    redirect_to controller: 'trips', action: 'index'

  end

  def create_omni

    binding.pry
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']

    end

    session[:user_id] = @user.id


    redirect_to controller: 'trips', action: 'index'

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
