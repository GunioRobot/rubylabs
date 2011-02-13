class CategoriesController < ApplicationController

  
  before_filter :authorize, :only => [:index]
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
   
  end
  
  def show
    @category = Category.find(params[:id])
    respond_to do |format|
      format.html {render :controller => :posts, :action => "show"}
    end
  end
  
  def edit
    @title = "Category"
    @category = Category.find(params[:id])
  end
  
    def create
    @category = Category.new(params[:category])
    respond_to do |format|
      if @category.save
        format.html {redirect_to(@category, :notice => "Category  successfully created.")}
      else
        format.html { render :controller => :posts, :action => "show"}
      end
    end
  end

  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update_attributes(params[:category])
          format.html { redirect_to(@category, :success => "Category successfully updated.")}
        else
        render :action => 'edit'
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "Category successfully destroyed."
    respond_to do |format|
      format.html {redirect_to(category_url)}
    end
  end
end
