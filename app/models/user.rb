class User < ApplicationRecord
   
    has_many :jobs
    has_many :reviews
    has_many :jobs, through: :reviews, dependent: :destroy
    has_many :categories, through: :jobs
    # has_many :reviewed_jobs, through: :reviews, source: :job
    validates :firstName, :lastName, presence: true 
    validates :email, uniqueness: true 
    validates :email, presence: true 
    

    has_secure_password
end


