class SessionsController < ApplicationController

  helper_method :current_user

  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      logger.debug "Session attributes hash: #{session.inspect}"
      redirect_to home_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out"
  end
end
