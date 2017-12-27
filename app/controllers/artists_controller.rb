class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show]

  def index
    @artists = Artist.all
  end

  def show; end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to @artist, notice: "Artist created"
    else
      render :new
    end
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params
      .require(:artist)
      .permit(
        :name
      )
  end

end
