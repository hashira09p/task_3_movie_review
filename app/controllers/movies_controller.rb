class MoviesController < ApplicationController

  before_action :set_movie, only: [:edit, :update, :destroy]

  def index
    @movies = Movie.includes(:genres).all
  end

  def new
    @movie  = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = 'Succesfully added'
      redirect_to movies_path
    else
      flash[:notice] = 'failed to add'
      render :new
    end

  end

  def edit;end

  def update
    if @movie.update(movie_params)
      flash[:notice] = 'Succesfully added'
      redirect_to root_path
    end
  end

  def destroy
    if @movie.destroy
      redirect_to root_path
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[ :id])
  end

  def movie_params
    params.require(:movie).permit(:title, :blurb, :date_released, :country_of_origin, :showing_start, :showing_end, :image, genre_ids: [])
  end
end