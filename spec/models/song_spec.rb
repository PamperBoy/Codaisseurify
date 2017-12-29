require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "Validation" do

    it "is invalid without a song name" do
      artist = Artist.new(name: "")
        artist.valid?
        expect(artist.errors).to have_key(:name)
    end
  end

  describe "Belongs to an artist" do

    NUMBER = 10
    let!(:artist) { create :artist }
    let!(:artist2) { create :artist }

    def generate_number_of_songs(number = NUMBER)
      number.times do
        artist.songs.create(name: "Song Name")
      end
    end

    it "belongs to an artist" do
      song = artist.songs.build(name: "Song Name")

      expect(song.artist).to eq(artist)
    end

    it "has one artist" do
      song = artist.songs.build(name: "Song Name")
      song.artist = artist2

      expect(artist2.songs).not_to include(song)
    end

    it "destroys a song" do
      generate_number_of_songs

      artist.songs.first.destroy
      expect(artist.songs.count).to match(NUMBER - 1)
    end
  end
end
