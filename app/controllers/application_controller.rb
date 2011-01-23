class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def categories
    @categories = Category.all
    return @categories
  end
  
  
end
