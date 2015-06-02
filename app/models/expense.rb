class Expense < ActiveRecord::Base
  has_many :payments
  has_many :users, through: :payments
  validates :name, presence: true, uniqueness: true
  validates :amount, presence: true, numericality: {greater_than: 0}
  before_save :generate_slug
  
  def generate_slug
    self.slug = self.name.gsub(" ", "-").downcase
  end
  
  def to_param
    self.slug
  end
end

