class SongsController < ApplicationController
  before_action :set_artist


  def new
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @artist, notice: "Added #{@song.name} to #{@artist.name}" }
        format.json { render json: @song, status: :created }
      else
        format.html { redirect_to @artist }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
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
