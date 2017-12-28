require 'rails_helper'

describe Artist, type: :model do
  describe "Validation" do

    it "is invalid without a artist name" do
      artist = Artist.new(name: "")
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end

    it "is invalid without a unique artist name" do
      artist1 = Artist.new(name: "Frank").save
      artist2 = Artist.new(name: "Frank")
      artist2.valid?
      expect(artist2.errors).to have_key(:name)
    end
  end

  describe "Artist has many songs" do
    NUMBER = 10
    let!(:artist) { create :artist }
    let!(:artist2) { create :artist }

    def generate_number_of_songs(number = NUMBER)
      number.times do
        artist.songs.create(name: "Song Name")
      end
    end

    it "should have #{NUMBER} songs" do
      generate_number_of_songs
      expect(artist.songs.count).to match(NUMBER)
    end

    it "Destroys an artist" do
      artist.destroy
      expect(Artist.all.count).to match(1)
    end

    it "should delete all songs when artist is destroyed" do
      generate_number_of_songs
      artist.destroy
      expect(Song.all.count).to match(0)
    end

  end
end
