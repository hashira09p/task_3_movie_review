class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movie  = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = 'Succesfully added'
      rendirect_to movies_path
    else
      flash[:notice] = 'failed to add'
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :blurb, :date_released, :country_of_origin, :showing_start, :showing_end, :image)
  end
end