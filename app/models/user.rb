class User < ApplicationRecord
  #Library association
  has_many :user_libraries
  
  # Removing any capitalization from email before recording user
   before_save { email.downcase! }

  # Email format regular expression
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  # Validating length and presence of :name parameter
  validates :name, presence: true, length: {minimum: 2, maximum: 32}
  
  # Validating length, presence, format and duplication of :email parameter
  validates :email, presence: true, length: {minimum:8, maximum:64},
  							format: {with: EMAIL_REGEX},
  							uniqueness: {case_sensitive: false}
  							
  # Adding secure password
  has_secure_password
  
  # Password validations
  validates :password, presence: true, length: {minimum: 6}
  
  # Avatar validations
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
