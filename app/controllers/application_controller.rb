class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :admin?

  before_filter :sidebar_categories, :sidebar_posts
#  before_filter :set_locale
  before_filter :set_user_language

#   def set_locale
# #    I18n.locale = extract_locale_from_tld
#     I18n.locale = "de"
#   end

  protected

  #  Rails.logger.level = 0
  def authorize
    unless current_user
      flash[:error] = "Unauthorized access denied."
      redirect_to log_in_path
      false
    end
  end

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
  
  def set_user_language
    I18n.locale = @current_user.language if @current_user
  end
  
  def sidebar_categories
   @sidebar_categories = Category.all
  end

  def sidebar_posts
    @sidebar_posts = Post.order("created_at DESC").limit(5)
  end
  
  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale : nil
  end
end
