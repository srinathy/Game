

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 
  before_save { |user| user.email = email.downcase }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
  validates :name,  presence: true, length:{maximum: 50}
  validates :email, presence: true, length:{maximum: 50}, format: {with: EMAIL_REGEX}, uniqueness: {case_sensitive: false}
end
