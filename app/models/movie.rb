class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :reviews, dependent: :destroy

  has_many :movie_genre_ships
  has_many :genres, through: :movie_genre_ships

  belongs_to :user

  def average_rating
    ratings = []
    total = 0

    reviews.each do |review|
      ratings.push(review.ratings)
    end

    if ratings.present?
      ratings.each do |rating|
        total += rating
      end
      total/ratings.size
    end
  end
end
