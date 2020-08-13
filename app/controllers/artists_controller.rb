class ArtistsController < ApplicationController
    before_action :require_login, :set_artist, only: [:show, :edit, :update, :destroy]
  
  def index
    @artists = current_user.artists
  end

  def new
    @artist = Artist.new
  end

  # def create
  #     @artist = Artist.find_or_create_by(artist_params)  
  #     redirect_to artist_path(@artist)
  # end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end
  

  private

  def set_artist
    @artist ||= Artist.find_by(id: params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :gender, :age, movie_ids:[], genre_ids:[], genres_attributes: [:name])
    # name_ids [] for child whereas name_id for parent, name_name for parent attribute
  end
end
