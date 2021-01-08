class Job < ApplicationRecord
    has_many :reviews
    belongs_to :user
    has_many :users, through: :reviews
    belongs_to :category
    validates :title, :phone, :adress, :email, presence: true
end

