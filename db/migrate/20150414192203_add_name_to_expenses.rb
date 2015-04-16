class AddNameToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :name, :string 
    add_column :expenses, :amount, :float
    add_column :expenses, :created_at, :datetime
    add_column :expenses, :updated_at, :datetime
  end
end
