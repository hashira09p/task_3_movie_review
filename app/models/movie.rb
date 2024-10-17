class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :reviews, dependent: :destroy

  has_many :movie_genre_ships
  has_many :genres, through: :movie_genre_ships

  belongs_to :user


end
