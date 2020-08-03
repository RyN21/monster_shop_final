require 'rails_helper'

RSpec.describe "User cart has discounts applied" do
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
  end

  describe "Applies discounts appropriately" do
    it "does not apply if minimum_quantity is not met" do
      within "#item-#{@item_1.id}" do
        expect(page).to have_content("Subtotal: $10.00")
      end
    end

    it "applies to item when minimum_quantity is met" do
      within "#item-#{@item_2.id}" do
        click_button 'More of This!'
        expect(page).to have_content("Subtotal: $19.00")
      end
    end

    it "only the larger discount is applied when item quantity meets more than one discount requiements" do
      within "#item-#{@item_1.id}" do
        expect(page).to have_content("Subtotal: $10.00")
        click_button 'More of This!'
        expect(page).to have_content("Subtotal: $19.00")
        click_button 'More of This!'
        click_button 'More of This!'
        click_button 'More of This!'
        click_button 'More of This!'
        expect(page).to have_content("Subtotal: $54.00")
      end
    end

    it "discounts only apply to items with the same merchant" do
      within "#item-#{@item_1.id}" do
        expect(page).to have_content("Subtotal: $10.00")
      end
      within "#item-#{@item_2.id}" do
        click_button 'More of This!'
        click_button 'More of This!'
        click_button 'More of This!'
        click_button 'More of This!'
        expect(page).to have_content("Subtotal: $45.00")
      end
      within "#item-#{@item_3.id}" do
        click_button 'More of This!'
        click_button 'More of This!'
        click_button 'More of This!'
        click_button 'More of This!'
        click_button 'More of This!'
        click_button 'More of This!'
        click_button 'More of This!'
        click_button 'More of This!'
        click_button 'More of This!'
        click_button 'More of This!'
        expect(page).to have_content("Subtotal: $93.50")
      end
    end
  end

  it "User can see price with and without the discount and how much they saved" do
    within "#item-#{@item_1.id}" do
      click_button 'More of This!'
      expect(page).to have_content("Subtotal: $20.00")
      expect(page).to have_content("Discounted Price: $19.00")
      expect(page).to have_content("You saved: $1.00!")
    end
  end
end



# If item from a mechant meets the merchants discount requiements, then the discount is applied to that item only
# item merchant. item discount.
#
# discount can have many items
# item has one discount... but not needed to be validated ==== but only one applies to it, the one with the greater savings
#
# item_discount table?
#
# create a joins table to apply discounts?
# So any item that where quantity is >= than minimum_quantity, the discount applies
#
# Joins table...
# I want to select ITEM
#
#
# ITEM                   DISCOUNT               MERCHANT
#
# SELECT.* items         minimum_quantity       id
#                        percent_off
#                        merchant_id
#
# Where item.merchant_id == discount.merchant_id



# was in show page:
# <% @discounts.each do |discount| %>
#   <%= discount(subtotal_of(item.id)) if discount.apply_discount?(cart.count_of(item.id)) %>
# <% end %>



# NOTES TO ADD TO APP
#
#
#
