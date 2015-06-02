class User < ActiveRecord::Base
  has_many :payments
  has_many :expenses, through: :payments
  has_secure_password validations: false
  
  validates :username, :email_address, presence: true, uniqueness: true 
  validates :first_name, :last_name, :password, presence: true
  before_save :generate_slug
  
  def generate_slug 
    self.slug = self.username.gsub(" ","-").downcase 
  end
  
  # def to_param
  #   self.slug
  # end 
end

