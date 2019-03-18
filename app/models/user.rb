require 'bcrypt'
class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true
    validates_length_of :password, minimum: 6
end
