require 'rails_helper'

RSpec.describe "Add bulk discount" do
  before :each do
    @merchant   = create(:merchant)
    @merch_user = create(:user, merchant: @merchant, email: 'merchant@test.com', role: 1)

    @discount_1 = create(:discount)
    @discount_2 = create(:discount)
    @discount_3 = create(:discount)

    visit '/login'
    within  "form" do
      fill_in :email,	with: 'merchant@test.com'
      fill_in :password,	with: @merch_user.password
      click_on 'Log In'
    end

    visit 'merchant/discounts'
  end

  it "has a link to a new discount page" do
    click_link "Add New Discount"

    expect(page).to eq('/merchant/dicounts/new')
  end

  it "can add a new discount with discount form" do
    visit '/merchant/dicounts/new'

    fill_in :name, with: "5% Bulk Discount"
    fill_in :description, with: "Get 5% of any item when you purchase 20 or more of that item!"
    fill_in :percent_off, with: 5
    fill_in :minimum_quantity, with: 20

    click_button "Create Discount"

    new_discount = Discount.last

    expect(current_path).to eq('/merchant/discounts')

    within "#discount-#{new_discount.id}" do
      expect(page).to have_content(new_discount.name)
      expect(page).to have_content(new_discount.description)
      expect(page).to have_content(new_discount.percent_off)
      expect(page).to have_content(new_discount.minimum_quantity)
    end
  end
end
