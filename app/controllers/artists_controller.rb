class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def create
    artist = Artist.create(artist_params)
    if artist.save
        redirect_to '/artists'
    else
      flash.now[:error] = "Artist not created, fill in all fields."
      render :new
    end
  end

  def destroy
    Artist.destroy(params[:id])
    redirect_to '/artists'
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
    if @artist.save
      redirect_to "/artists"
    else
      flash[:error] = "Artist not updated, fill in all fields."
      render :edit
    end
  end

  private
    def artist_params
      params.permit(:name)
    end
end
