FactoryBot.define do
  factory :song do
    name            { Faker::Movie.quote }
    artist_id       { build(:artist) }
  end
end
