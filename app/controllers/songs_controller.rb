class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: [:destroy]


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
    @song.destroy
    respond_to do |format|
      format.html { redirect_to @artist, notice: 'Song deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params
      .require(:song)
      .permit(
        :name
      )
  end
end
