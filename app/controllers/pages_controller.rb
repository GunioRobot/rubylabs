class PagesController < ApplicationController
  def home
    @title = "home"
  end

  def about
    @title = "about"
  end

  def contact
    @title = "contact"
  end
  
  def blog
    @title = "blog"
  end

end
