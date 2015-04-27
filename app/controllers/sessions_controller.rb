class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(username: params[:username])
  
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:notice] = "You've logged in successfully"
      redirect_to payments_path 
    else 
      flash[:error] = "Please enter the correct username and password." 
      render 'new'
    end  
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out."
    redirect_to '/'
  end
  
  def logged_in?
    !!current_user
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end 
