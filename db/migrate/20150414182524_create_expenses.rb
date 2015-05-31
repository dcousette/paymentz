class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :expense_name
      t.float :expense_amount 
    end
  end
end
