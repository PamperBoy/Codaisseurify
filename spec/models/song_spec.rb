require 'rails_helper'

RSpec.describe Song, type: :model do
  it "is invalid without a song name" do
    artist = Artist.new(name: "")
      artist.valid?
      expect(artist.errors).to have_key(:name)
  end
end
