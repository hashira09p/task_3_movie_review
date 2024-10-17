class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  after_create :calculate_average_rating

  def calculate_average_rating
    ratings = []
    total = 0

    movie.reviews.each do |review|
      ratings.push(review.ratings)
    end

    if ratings.present?
      ratings.each do |rating|
        total += rating
      end
      movie.update(average_rating: total/ratings.size)
    end
  end
end
