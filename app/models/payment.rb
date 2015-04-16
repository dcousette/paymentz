class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :expense 
  validates :payment_name, :payment_amount, :user_id, :expense_id, presence: :true
end