require 'rails_helper'

RSpec.describe "Discount Index Page" do
  before :each do
    @merchant_1   = create(:merchant)
    @merchant_2   = create(:merchant)
    @item_1       = create(:item,     merchant: @merchant_1,   inventory:   50, price: 10)
    @item_2       = create(:item,     merchant: @merchant_1,   inventory:   50, price: 10)
    @item_3       = create(:item,     merchant: @merchant_2,   inventory:   50, price: 10)
    @item_4       = create(:item,     merchant: @merchant_2,   inventory:   50, price: 10)
    @discount_1   = create(:discount, merchant: @merchant_1,   percent_off: 5,  minimum_quantity: 2)
    @discount_2   = create(:discount, merchant: @merchant_1,   percent_off: 10, minimum_quantity: 5)
    @discount_3   = create(:discount, merchant: @merchant_2,   percent_off: 15, minimum_quantity: 10)
  end
  it "As a visitor I can seed all discounts and their info" do
    visit '/discounts'

    expect(page).to have_content(@discount_1.name)
    expect(page).to have_content(@discount_2.name)
    expect(page).to have_content(@discount_3.name)
    expect(page).to have_content(@discount_1.merchant.name)
    expect(page).to have_content(@discount_2.merchant.name)
    expect(page).to have_content(@discount_3.merchant.name)
  end
end
