class Movie < ApplicationRecord
  before_save :generate_slug
  mount_uploader :image, ImageUploader
  has_many :reviews, dependent: :destroy

  has_many :movie_genre_ships
  has_many :genres, through: :movie_genre_ships

  belongs_to :user



  private

  def generate_slug
    unique_slug = SecureRandom.alphanumeric(7)
    self.slug = unique_slug
  end
end
