class Review < ApplicationRecord
    belongs_to :user
    belongs_to :job

    validates :description, presence: true, length: { in: 10..500 }

    validates :job, uniqueness: { scope: :user, message: "has already been reviewed by you"  }


end
