class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :payment_name
      t.float :payment_amount
      t.integer :user_id 
      t.integer :expense_id
      t.timestamps 
    end
  end
end
