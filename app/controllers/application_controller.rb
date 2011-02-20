class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :admin?

  before_filter :categories, :posts

  protected

  #  Rails.logger.level = 0
  def authorize
    unless current_user
      flash[:error] = "Unauthorized access denied."
      redirect_to log_in_path
      false
    end
  end

  debugger
  def admin?
    user = User.find(session[:user_id]) if session[:user_id]
    if user && user.admin
      true
    else
      false
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def categories
    @categories = Category.all
    return @categories
  end

  def posts
    @posts = Post.all
  end

end
