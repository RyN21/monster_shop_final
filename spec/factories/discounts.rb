FactoryBot.define do
  factory :discount do
    merchant
    name             { Faker::JapaneseMedia::SwordArtOnline.item }
    description      { Faker::TvShows::RickAndMorty.quote }
    percent          { rand(10..75) }
    minimum_quantity { rand(5..100) }
  end
end
