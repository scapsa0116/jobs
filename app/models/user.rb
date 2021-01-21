class User < ApplicationRecord
    has_secure_password
    has_many :jobs
    has_many :reviews
    has_many :jobs, through: :reviews, dependent: :destroy
    has_many :categories, through: :jobs
    # has_many :reviewed_jobs, through: :reviews, source: :job
    validates :firstName, :lastName, presence: true 
    validates :email, uniqueness: true 
    validates :email, presence: true 
    

   


    def self.from_omniauth(auth)
      where(email: auth.info.email).first_or_initialize do |user|
        user.email = auth.info.email
        user.password = SecureRandom.hex
      end
    end
end


