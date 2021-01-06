class User < ApplicationRecord
    has_secure_password
    has_many :jobs
    has_many :reviews
    validates :firstName, :lastName, presence: true 
    validates :email, uniqueness: true, presence: true 
    has_many :categories, through: :jobs

    
end


