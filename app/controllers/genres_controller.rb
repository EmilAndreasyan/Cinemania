class GenresController < ApplicationController
  before_action :require_login, :set_genre, only: [:show, :edit, :update, :destroy]

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end  

  def create
    @genre = Genre.find_or_create_by(genre_params)
    redirect_to genres_path
  end

  def show
  end

  def action
    @genres = Genre.action # from Genre model scope method
    render :index
  end

  def drama
    @genres = Genre.drama
    render :index
  end

  def edit
  end

  def update
    @genre.update(genre_params)
    redirect_to genres_path
  end

  def destroy
    @genre.destroy
    redirect_to genres_path
  end
    
  private

  def set_genre
    @genre = Genre.find_by(id: params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name, movie_ids:[], artist_ids:[], artists_attributes: [:name, :age, :gender])
  end
end
