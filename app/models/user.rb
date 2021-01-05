class User < ApplicationRecord
    has_secure_password
    has_many :jobs
    validates :firstName, :lastName, presence: true 
    validates :firstName, :lastName, length: { minimum: 2 }
    validates :email, uniqueness: true
    validates :password_digest, 
          presence: true,
          length: { minimum: 5 } || @error="At least 5 characters",

end


