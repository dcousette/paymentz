class User < ActiveRecord::Base
  has_many :payments
  has_many :expenses, through: :payments
  has_secure_password validations: false
  
  validates :username, :email_address, presence: true, uniqueness: true 
  validates :first_name, :last_name, :password, presence: true
  
  def total_payments
    total = 0 
    self.payments.each do |payment|
      total += payment[:payment_amount]
    end
    total 
  end
  
  def payments_this_month 
    total = 0 
    self.payments.all.each do |payment|
      total += payment[:payment_amount] if Time.now.month == payment.created_at.month 
    end
    total 
  end 
end

