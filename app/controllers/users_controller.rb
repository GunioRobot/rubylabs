class UsersController < ApplicationController
  
  before_filter :authorize, :except => [:new, :create, :show]
  
  def index
    if admin?
    @users = User.paginate(:page => params[:page])
      else
      flash[:error] = "Unauthorized Access Denyed."
      redirect_to :log_in
    end  
  end
  
  def new
    @user = User.new
  end 
  
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @title = "Edit"
    if admin?

      @user = User.find(params[:id])
    else
      flash[:error] = "Unauthorized Access Denyed"
      redirect_to :log_in
    end
  end
    
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :success => "User successfully created!") }
      else
 #       render :controller => "sessions", :action => "new"
      end
    end
  end

  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
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
  
  
  # def authorize
  #   @user = User.find(params[:id])
  #   if true
  #     flash[:notice] = "You must be an admin to enter this page!"
  #     redirect_to :controller => :sessions, :action => :new
  #   end
  # end
 end
