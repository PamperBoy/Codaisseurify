require 'faker'

Artist.destroy_all

20.times{ Artist.create!(name: Faker::RockBand.unique.name) }

Artist.all.each do | artist |
  rand(3..10).times do
    artist.songs.create!(name: Faker::Book.unique.title)
  end
end
