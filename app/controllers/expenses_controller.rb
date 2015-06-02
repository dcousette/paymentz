class ExpensesController < ApplicationController 
  before_action :require_user
  before_action :setup_expense, except: [:new, :create]
  
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
  
  def edit
  end
  
  def update
    @expense.update(expense_params)
    
    if @expense.save 
      flash[:notice] = "Expense has been updated"
      redirect_to user_path(current_user)
    else 
      render 'edit'
    end
  end
  
  def show 
  end 
  
  private 
  
  def expense_params
   params.require(:expense).permit(:name, :amount)
  end
  
  def setup_expense
    @expense = Expense.find_by(slug: params[:id])
  end
end