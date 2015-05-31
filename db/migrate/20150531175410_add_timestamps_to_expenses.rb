class AddTimestampsToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :created_at, :string
    add_column :expenses, :updated_at, :string
  end
end
