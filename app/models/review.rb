class Review < ApplicationRecord
    belongs_to :user
    belongs_to :job

    validates :description, presence: true
end
