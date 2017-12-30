require 'faker'

Image.destroy_all
Artist.destroy_all

20.times{ Artist.create!(name: Faker::RockBand.unique.name) }

Artist.all.each do | artist |
  rand(3..10).times do
    artist.songs.create!(name: Faker::Book.unique.title)
  end
  Image.create!(remote_source_url: "http://res.cloudinary.com/pamperboy/image/upload/v1514582367/1e86cb383ca99f71a6de0c064ff41219--guitar-players-deep-purple_lrs1ns.jpg", artist: artist)
end
