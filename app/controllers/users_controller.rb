class UsersController < ApplicationController
  
  def index
    @users = User.paginate(:page => params[:page])
  end
  
  def new
    @user = User.new
  end 
  
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @title = "Edit"
    @user = User.find(params[:id])
  end
    
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :success => "User successfully created!") }
      else
        render :controller => :session, :action => "new"
      end
    end
  end

  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:category])
        format.html { redirect_to(@user, :success => "User successfully updated.")}
        else
        render :action => 'edit'
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User successfully destroyed."
    respond_to do |format|
      format.html { redirect_to(users_url)}
    end
  end
end
