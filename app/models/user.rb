class User < ApplicationRecord
    has_many :to_dos, dependent: :destroy
    has_many :lists

    validates :username, presence: true, length: { minimum: 6, maximum: 20 , notice: "must be between 6 and 20 characters"}
    validates :password, presence: true
    
    has_secure_password
end