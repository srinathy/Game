

class User < ActiveRecord::Base
  has_one :basket
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
  validates :name,  presence: true, length:{maximum: 50}
  validates :email, presence: true, length:{maximum: 50}, format: {with: EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
