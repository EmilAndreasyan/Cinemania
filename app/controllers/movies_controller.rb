class MoviesController < ApplicationController
    before_action :require_login
    before_action :set_movie, only: [:edit, :update, :show, :destroy]
    before_action :set_user
  
  def index
    @movies = current_user.movies
  end

  def new
    @movie = Movie.new
  end

  def create
    # @user = User.find_by(id: params[:movie][:user_id])
    @movie = current_user.movies.build(movie_params)
    # @movie.artist = Artist.find_or_create_by(artist_params)
    # @movie.genre = Genre.find_or_create_by(genre_params)
    if @movie.save
      redirect_to user_movies_path(@movie.user)
    else
      render :new
    end
  end

  def show
    set_user
  end

  def drama
    @movies = Movie.drama
    render :index
  end

  def edit
   set_user
  end

  def update
    @movie.update(movie_params)
    redirect_to user_movie_path(@movie)
  end

  def destroy
    @movie.destroy
    redirect_to user_movies_path
  end
  
  private

  def set_user
    @user ||= User.find_by(params[:user_id]) # return @user if it exists, if nil, finds it
  end

  def set_movie
    @movie = Movie.find_by(id: params[:id])
    # @movie = User.find_by(id: params[:id]).movies.find_by(:id params[:id)
  end

  

  def movie_params
    params.require(:movie).permit(:title, :duration, :budget, :user_id, :artist_id, :genre_id) # parent_id
  end

  def artist_params
    params.require(:artist).permit(:name, :gender, :age)
  end

  def genre_params
    params.require(:genre).permit(:name)
  end

end
