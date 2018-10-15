class Comment < ActiveRecord::Base
    belongs_to :user, required: true
    belongs_to :review, required: true
end
