Artist.destroy_all

artist_1 = Artist.create!(name: "Slipknot")
artist_2 = Artist.create!(name: "Beatles")
artist_3 = Artist.create!(name: "ACDC")
artist_4 = Artist.create!(name: "John Butler Trio")
artist_5 = Artist.create!(name: "Deep Purple")
artist_6 = Artist.create!(name: "Red Hot Chilly Peppers")

song_1 = Song.create!(name: "Song Name", artist: artist_1)
song_2 = Song.create!(name: "Song Name", artist: artist_1)
song_3 = Song.create!(name: "Song Name", artist: artist_2)
song_4 = Song.create!(name: "Song Name", artist: artist_2)
song_5 = Song.create!(name: "Song Name", artist: artist_3)
song_6 = Song.create!(name: "Song Name", artist: artist_4)
song_7 = Song.create!(name: "Song Name", artist: artist_5)
song_8 = Song.create!(name: "Song Name", artist: artist_5)
song_9 = Song.create!(name: "Song Name", artist: artist_6)
song_10 = Song.create!(name: "Song Name", artist: artist_6)
