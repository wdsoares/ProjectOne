require 'bcrypt'
class User < ApplicationRecord
    has_secure_password
    has_many :produto
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true
    validates_length_of :password, minimum: 6
end
