class SongsController < ApplicationController
  before_action :set_artist


  def new
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.new(song_params)

    if @song.save
      redirect_to @artist, notice: "Song created"
    else
      render :new
    end
  end

  def destroy
    @artist.songs.find(params[:id]).destroy

    redirect_to @artist, notice: "Delete success"
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def song_params
    params
      .require(:song)
      .permit(
        :name
      )
  end
end
