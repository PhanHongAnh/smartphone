class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :banner
      t.string :content
      t.boolean :state, default: false
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
