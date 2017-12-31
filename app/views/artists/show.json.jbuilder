json.artist @artist, partial: 'artists/artist', as: :artist

json.songs @artist.songs, partial: 'songs/song', as: :song

json.image @artist.image
