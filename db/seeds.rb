Artist.destroy_all

artist_1 = Artist.create!(name: "Slipknot")
artist_2 = Artist.create!(name: "Beatles")
artist_3 = Artist.create!(name: "ACDC")
artist_4 = Artist.create!(name: "John Butler Trio")
artist_5 = Artist.create!(name: "Deep Purple")
artist_6 = Artist.create!(name: "Red Hot Chilly Peppers")

song_1 = Song.create!(name: "Better Than", artist: artist_4)
