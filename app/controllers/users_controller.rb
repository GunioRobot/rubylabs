class UsersController < ApplicationController
  
  def index
    @users = User.all
    @users = User.paginate(:page => params[:page])
  end
  
  def new
  end

end
