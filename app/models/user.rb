class User < ApplicationRecord
   
    has_many :jobs
    has_many :reviews, foreign_key: "reviewer_id", class_name: "Review"
    has_many :categories, through: :jobs
    has_many :reviewed_jobs, through: :reviews, source: :job
    validates :firstName, :lastName, presence: true 
    validates :email, uniqueness: true 
    validates :email, presence: true 
    

    has_secure_password
end


