# This will guess the User class
FactoryBot.define do
  factory :item do
    merchant
    name         { Faker::JapaneseMedia::SwordArtOnline.item }
    description  { Faker::TvShows::RickAndMorty.quote }
    price        { rand(1..100) }
    inventory    { rand(1..66) }
    image        { Faker::Avatar.image }
  end
end
