require 'rails_helper'

RSpec.describe "User cart has discounts applied" do
  before :each do
    @merchant_1   = create(:merchant)
    @merchant_2   = create(:merchant)
    @item_1       = create(:item,     merchant: @merchant_1, inventory:   50, price: 10)
    @item_2       = create(:item,     merchant: @merchant_1, inventory:   50, price: 10)
    @item_3       = create(:item,     merchant: @merchant_2, inventory:   50, price: 10)
    @item_4       = create(:item,     merchant: @merchant_2, inventory:   50, price: 10)
    @discount_1   = create(:discount, merchant: @merchant_1,   percent_off: 5,  minimum_quantity: 2)
    @discount_2   = create(:discount, merchant: @merchant_1,   percent_off: 10, minimum_quantity: 5)
    @discount_3   = create(:discount, merchant: @merchant_1,   percent_off: 15, minimum_quantity: 10)

    @user         = create(:user)

    visit '/login'
    within  "form" do
      fill_in :email,	with: @user.email
      fill_in :password,	with: @user.password
      click_on 'Log In'
    end

    visit item_path(@item_1)
    click_button 'Add to Cart'

    visit item_path(@item_2)
    click_button 'Add to Cart'

    visit item_path(@item_3)
    click_button 'Add to Cart'


    visit '/cart'
    save_and_open_page
  end

  it "has discounts appropriately" do
    within "#item-#{@item_1.id}" do
      expect(page).to have_content("Subtotal: $10.00")
    end

    within "#item-#{@item_2.id}" do
      click_button 'More of This!'
      expect(page).to have_content("Subtotal: $19.00")
      click_button 'More of This!'
      expect(page).to have_content("Subtotal: $28.50")
    end

    within "#item-#{@item_3.id}" do
      click_button 'More of This!'
      click_button 'More of This!'
      click_button 'More of This!'
      click_button 'More of This!'
      click_button 'More of This!'
      expect(page).to have_content("Subtotal: $54.00")
    end
  end
end

# User Story 7, When a user places items in cart
# and meets discount requirements
# User's cart has discounts
#
# As a visitor
# When adding items to the cart
# and adding the minimum quantity of an item
# a bulk discount is added to that one item only
# a flash message indicate bulk discount has been added
