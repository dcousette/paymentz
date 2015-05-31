class RemoveExpenseNameFromExpenses < ActiveRecord::Migration
  def change
    remove_column :expenses, :expense_name
    remove_column :expenses, :expense_amount
  end
end
