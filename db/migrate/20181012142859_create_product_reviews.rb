class CreateProductReviews < ActiveRecord::Migration
  def change
    create_table :product_reviews do |t|
      t.integer :product_id
      t.integer :review_id

      t.timestamps null: false
    end
  end
end
