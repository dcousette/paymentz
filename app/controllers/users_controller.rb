class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save 
      flash[:notice] = "Your user was created."
      redirect_to payments_path 
    else 
      render 'new'
    end
  end
  
  def edit 
  end
  
  def update
    
    if @user.update(user_params)
      flash[:notice] = "Your user has been updated."
      redirect_to user_path(@user)
    else 
      render 'edit'
    end
  end
  
  def show
    @expenses = Expense.all 
  end
  
  private 
  
  def user_params 
    params.require(:user).permit(:username, :first_name, :last_name, :email_address, :password)    
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end

