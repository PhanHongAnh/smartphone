class Review < ActiveRecord::Base
    belongs_to :user, required: true
    
    has_many :product_reviews, dependent: :destroy
    has_many :products, through: :product_reviews
    
    has_many :comments, dependent: :destroy
    
    accepts_nested_attributes_for :products
    
    validates :title, presence: true
    validates :content, presence: true
    
    scope :order_by_time, ->{order created_at: :asc}
    scope :order_by_cmt, ->{order cmt_count: :desc}
end
