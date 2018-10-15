class Review < ActiveRecord::Base
    belongs_to :user, required: true
    
    has_many :product_reviews, dependent: :destroy
    has_many :products, through: :product_reviews
    
    has_many :comments, dependent: :destroy
end
