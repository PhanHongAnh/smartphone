class ReviewsController < ApplicationController
  def index
    @reviews = Review.all.group_by{|review| review.created_at.strftime('%Y-%m-%d')}
    @reviews = @reviews.sort_by{ |day, _review| day }
  end
end
