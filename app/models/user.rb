class User < ApplicationRecord
    before_save{self.email = email.downcase}
    before_save{self.username = username.downcase}
    has_many :posts
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true,uniqueness: { case_sensitive: false },format:  {with: VALID_EMAIL_REGEX} 
    validates :phone, presence: true,uniqueness: true, numericality: true,length: {minimum: 10 , maximum: 10}
    has_secure_password
end
