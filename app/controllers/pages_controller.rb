class PagesController < ApplicationController
  def home
    @tilte = "home"
  end

  def about
    @tilte = "about"
  end

  def contact
    @tilte = "contact"
  end
  
  def blog
    @title = "blog"
  end

end
