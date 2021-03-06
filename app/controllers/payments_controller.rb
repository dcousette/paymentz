class PaymentsController < ApplicationController 
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  before_action :require_same_user, only: [:edit, :update] 
  
  def index
    @payments = Payment.all 
    @expenses = Expense.all 
  end 
  
  def show
  end
  
  def new
    @payment = Payment.new 
  end 
  
  def create
    @payment = Payment.new(payment_params)
    @payment.user_id = session[:user_id]
    
    if @payment.save 
      flash[:notice] = "Your payment was created successfully!"
      redirect_to payments_path 
    else 
      render 'new'
    end
  end
  
  def edit
  end
  
  def update 
    if @payment.update(payment_params)
      flash[:session] = "Your payment has been updated successfully."
      redirect_to payment_path(@payment)
    else
      render 'edit'
    end
  end
  
  def destroy 
    @payment.destroy
  end
  
  private 
    def payment_params
      params.require(:payment).permit(:payment_name, :payment_amount, :expense_id)
    end
    
    def set_payment
      @payment = Payment.find_by(slug: params[:id])
    end
    
    def require_same_user
      if @current_user != @payment.user 
        flash[:error] = "You can't do that!"
        redirect_to :back
      end
    end
end
