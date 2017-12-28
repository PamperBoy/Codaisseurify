require 'rails_helper'

describe Artist, type: :model do
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
