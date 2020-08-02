FactoryBot.define do
    factory :review do
      item
      title        { Faker::Movies::HarryPotter.spell }
      description  { Faker::TvShows::RickAndMorty.quote }
      rating       { rand(1..5) }
    end
  end
