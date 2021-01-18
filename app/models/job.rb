class Job < ApplicationRecord
    has_many :reviews
    belongs_to :user
    has_many :users, through: :reviews
    belongs_to :category


    has_attached_file :image, styles: { medium: "400x600#"}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    validates :image, presence: true





    validates :title, :phone, :adress, :email, presence: true
end

