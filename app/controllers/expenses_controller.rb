class ExpensesController < ApplicationController 
  before_action :require_user
  
  def new
    @expense = Expense.new
  end 
  
  def create
    @expense = Expense.new(expense_params)
    
    if @expense.save 
      flash[:notice] = "Your new expense has been added"
      redirect_to payments_path 
    else 
      render 'new'
    end
  end
  
  def show 
    @expense = Expense.find(params[:id])  
  end 
  
  private 
  
  def expense_params
   params.require(:expense).permit(:name, :amount)
  end 
end