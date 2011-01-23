class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
   
  end
  
  
  def create
    @category = Category.(params[:category])

    respond_to do |format|
      if @category.save
        format.html {redirect_to(@post, :notice => "Category was successfully created.")}
      else
        format.html { render :controller => :posts, :action => "show"}
      end
    end

  end
  
  def destroy
    @category.destroy
  end
   
end
