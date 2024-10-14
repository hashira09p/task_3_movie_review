class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :reviews

  has_many :movie_genre_ships
  has_many :genres, through: :movie_genre_ships
end
