class MoviesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_movie, only: [:edit, :update, :destroy]
  before_action :validate_movie_owner, only: [:edit, :update, :destroy]

  def index;
    filter
  end

  def new
    @movie  = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    if @movie.save
      flash[:notice] = 'Succesfully added'
      redirect_to root_path
    else
      flash[:alert] = 'failed to add'
      render :new
    end
  end

  def edit;end

  def update
    if @movie.update(movie_params)
      flash[:notice] = 'Succesfully updated'
      redirect_to root_path
    end
  end

  def destroy
    if @movie.update(deleted_at: Time.now)
      redirect_to root_path
    end
  end


  private

  def set_movie
    @movie = Movie.find_by(slug: params[:slug]) || Movie.find_by(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :blurb, :date_released, :country_of_origin, :showing_start, :showing_end, :image, :slug, genre_ids: [])
  end

  def validate_movie_owner
    unless @movie.user == current_user
      flash[:alert] = 'the Movie review post not belongs to you'
      redirect_to root_path
    end
  end

  def filter
    if params[:genre] == 'All' || params[:genre].blank?
      @movies = Movie.includes(:genres, :user)
                     .where(deleted_at: nil) # Exclude deleted movies
                     .order(average_rating: :desc)
                     .page(params[:page])
                     .per(3)
    else
      @genre = Genre.find_by(name: params[:genre])
      if @genre
        @movies = @genre.movies.includes(:genres, :user)
                        .where(deleted_at: nil) # Exclude deleted movies
                        .order(average_rating: :desc)
                        .page(params[:page])
                        .per(3)
      else
        @movies = Movie.includes(:genres, :user)
                       .where(deleted_at: nil) # Exclude deleted movies
                       .order(average_rating: :desc)
                       .page(params[:page])
                       .per(3)
      end
    end
  end
end