module SessionsHelper
  
  def deny_access
    redirect_to sign_in_path, :notice => "Please sign in to access this page"
  end
end
