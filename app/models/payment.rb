class Payment < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :expense 
  validates :payment_name, :payment_amount, :user_id, :expense_id, presence: :true
  validates :payment_amount, numericality: {greater_than: 0}
  validates :payment_name, uniqueness: true
  before_save :generate_slug
  
  def self.total_payments 
    total = 0 
    self.all.each do |payment|
      total += payment[:payment_amount]
    end
    total 
  end 
  
  def self.payments_this_month 
    total = 0 
    self.all.each do |payment|
      total += payment[:payment_amount] if Time.now.month == payment.created_at.month 
    end
    total 
  end
  
  def generate_slug
    self.slug = self.payment_name.gsub(" ", "-").downcase
  end
  
  def to_param
    self.slug
  end
  
end
