class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(username: params[:username])
  
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:notice] = "You've logged in successfully"
      redirect_to user_path(user) 
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
end 
