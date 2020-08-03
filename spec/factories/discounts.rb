FactoryBot.define do
  factory :discount do
    merchant
    name             { Faker::Movies::HarryPotter.spell }
    description      { Faker::Marketing.buzzwords }
    percent_off      { rand(10..75) }
    minimum_quantity { rand(5..100) }
  end
end
