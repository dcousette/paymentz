class User < ActiveRecord::Base
  has_many :payments
  has_many :expenses, through: :payments
end

