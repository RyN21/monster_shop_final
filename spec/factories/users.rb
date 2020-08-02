FactoryBot.define do
    factory :user do
      merchant
      name     { Faker::JapaneseMedia::SwordArtOnline.game_name }
      address  { Faker::Address.street_address }
      city     { Faker::Address.city }
      state    { Faker::Address.state_abbr }
      zip      { Faker::Address.zip }
      password { "123456" }
      sequence :email do |n|
        "test#{n}@test.com"
      end
    end
  end
