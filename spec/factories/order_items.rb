FactoryBot.define do
    factory :order_items do
      price    { rand(1..1000) }
      quantity { rand(1..66) }
      item
      order
    end
  end
