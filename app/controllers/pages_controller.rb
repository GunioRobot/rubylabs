class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def about
    @title = t("nav.about")
  end

  def contact
    @title = "Contact"
  end

  def blog
    @title = "Blog"
  end
end
