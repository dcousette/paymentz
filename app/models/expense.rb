class Expense < ActiveRecord::Base
  has_many :payments
  has_many :users, through: :payments
  validates :name, presence: true, uniqueness: true
  validates :amount, presence: true, numericality: {greater_than: 0}
end

