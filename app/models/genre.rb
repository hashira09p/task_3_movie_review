class Genre < ApplicationRecord
  has_many :movie_genre_ships
  has_many :movies, through: :movies_genre_ships
end
