class Product < ActiveRecord::Base
    belongs_to :maker, required: true
    
    has_many :product_reviews, dependent: :destroy
    has_many :reviews, through: :product_reviews
    
    validates :name, presence: true
    validates :category, presence: true
end
