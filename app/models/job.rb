class Job < ApplicationRecord

    # include Elasticsearch::Model
    # include Elasticsearch::Model::Callbacks
    
    
    has_many :reviews
    belongs_to :user
    has_many :users, through: :reviews
    belongs_to :category


    has_attached_file :image, styles: { medium: "300x300#"}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    validates :image, presence: true


    def category_attributes=(attributes)
        self.category = Category.find_or_create_by(attributes) if !attributes['name'].empty?
        self.category
      end


    validates :title, :phone, :adress, :email, presence: true


   
end

