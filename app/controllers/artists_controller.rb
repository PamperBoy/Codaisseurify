  class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :destroy]

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

        # @artist.image.create(source: source_params)
      @artist.create_image(source: source_params)

      redirect_to @artist, notice: "Artist created"
    else
      render :new
    end
  end

  def destroy
    @artist.destroy

    redirect_to root_path, notice: "Delete success"
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def source_params
    params[:source].present? ? params.require(:source) : []

  end

  def artist_params
    params
      .require(:artist)
      .permit(
        :name
      )
  end

end
