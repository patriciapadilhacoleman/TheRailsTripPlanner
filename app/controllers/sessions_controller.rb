class SessionsController < ApplicationController
  def new

  end

  def create

    if params[:provider]
      user = User.create_with_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to controller: 'trips', action: 'index'

    else

      if user = User.find_by(username: params[:user][:username])

      else
          flash[:alert] = "This username is invalid!"
      end

      user = user.try(:authenticate, params[:user][:password])

      if user
        session[:user_id] = user.id
        @user = user
        redirect_to controller: 'trips', action: 'index'

      else
        flash[:alert] = "The password is invalid!"
    
        redirect_to controller: 'sessions', action: 'create'

      end

    end

  end


  def destroy

    session[:user_id] = nil
    redirect_to login_url
  end

  private



end
