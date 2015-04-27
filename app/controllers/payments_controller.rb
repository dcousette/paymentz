class PaymentsController < ApplicationController 
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  
  
  def index
    @payments = Payment.all 
  end 
  
  def show
  end
  
  def new
    @payment = Payment.new 
  end 
  
  def create
    @payment = Payment.new(payment_params)
    
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
  
  def set_payment
    @payment = Payment.find(params[:id])
  end
  
  private 
    def payment_params
      params.require(:payment).permit(:payment_name, :payment_amount, :user_id, :expense_id)
    end
end
