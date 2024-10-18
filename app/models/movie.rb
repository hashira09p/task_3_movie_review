class Movie < ApplicationRecord
  before_save :generate_slug
  mount_uploader :image, ImageUploader
  has_many :reviews, dependent: :destroy

  has_many :movie_genre_ships
  has_many :genres, through: :movie_genre_ships

  belongs_to :user



  private

  def generate_slug
    base_slug = title.parameterize # or any other attribute you want to use
    unique_slug = base_slug
    count = 1
    while self.class.exists?(slug: unique_slug) do
      unique_slug = "#{base_slug}-#{SecureRandom.alphanumeric(6)}-#{count}"
      count += 1
    end
    self.slug = unique_slug
  end
end
