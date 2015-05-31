class RemoveTimestampsFromExpenses < ActiveRecord::Migration
  def change
    remove_column :expenses, :created_at
    remove_column :expenses, :updated_at
  end
end
