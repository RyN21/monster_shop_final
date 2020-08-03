require 'rails_helper'

RSpec.describe "Discounts deleted when Merchant is deleted" do
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

    @merchant         = create(:user, role: 1)

    visit '/login'
    within  "form" do
      fill_in :email,	with: @merchant.email
      fill_in :password,	with: @merchant.password
      click_on 'Log In'
    end

  end
   it "discounts are deleted when merchant is deleted" do
     visit '/discounts'
     expect(page).to have_content(@discount_1.name)
     expect(page).to have_content(@discount_1.name)

     visit "/merchants/#{@merchant_1.id}"

     click_button 'Delete'

     expect(current_path).to eq('/merchants')
     expect(page).to_not have_content(@merchant_1.name)

     visit '/discounts'
     expect(page).to_not have_content(@discount_1.name)
     expect(page).to_not have_content(@discount_1.name)
   end
end
