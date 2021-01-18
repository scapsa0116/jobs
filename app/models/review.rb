class Review < ApplicationRecord
    belongs_to :user
    belongs_to :job

    validates :description, presence: true, length: { in: 10..500 }
end
