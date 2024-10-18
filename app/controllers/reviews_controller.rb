class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_movie
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :validate_review_owner, only: [:edit, :update, :destroy]
  def index
    @reviews = @movie.reviews.includes(:user).order(created_at: :desc)
  end

  def new
    @review = @movie.reviews.build
  end

  def create
    @review = @movie.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      flash[:notice] = 'Review created successfully'
      redirect_to movie_reviews_path(@movie)
    else
      flash.now[:alert] = 'Failed to create review'
      render :new
    end
  end

  def edit;end

  def update
    if @review.update(review_params)
      flash[:notice] = 'Model updated successfully'
      redirect_to movie_reviews_path(@movie)
    end
  end

  def destroy
    @review.destroy
    flash[:Alert] = 'Comment deleted successfully'
    redirect_to movie_reviews_path(@movie)
  end

  private

  def set_movie
    @movie = Movie.find_by!(slug: params[:movie_slug])
  end

  def set_review
    @review = @movie.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :ratings)
  end

  def validate_review_owner
    unless @review.user == current_user
      flash[:alert] = 'The review not belongs to you'
      redirect_to movie_reviews_path(@movie)
    end
  end


end