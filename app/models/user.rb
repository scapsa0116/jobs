class User < ApplicationRecord
    has_secure_password
    has_many :jobs
    has_many :reviews
    has_many :reviewed_jobs, through: :reviews, source: :jobs
    has_many :jobs, through: :reviews, dependent: :destroy
    has_many :categories, through: :jobs
    # has_many :reviewed_jobs, through: :reviews, source: :job
   
    validates :email, uniqueness: true 
    validates :email, presence: true 
    

    def self.from_omniauth(auth)
      User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |user|
        user.email = auth['info']['email']
        user.password = SecureRandom.hex
      end
    end

end


