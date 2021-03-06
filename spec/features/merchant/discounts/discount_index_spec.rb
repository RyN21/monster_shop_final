require 'rails_helper'

RSpec.describe "Discount index page" do
  before :each do
    @merchant   = create(:merchant)
    @merch_user = create(:user, merchant: @merchant, email: 'merchant@test.com', role: 1)

    @discount_1 = create(:discount, merchant: @merchant)
    @discount_2 = create(:discount, merchant: @merchant)
    @discount_3 = create(:discount, merchant: @merchant)

    visit '/login'
    within  "form" do
      fill_in :email,	with: 'merchant@test.com'
      fill_in :password,	with: @merch_user.password
      click_on 'Log In'
    end
  end

  it "merchant has link to discount index page" do
    expect(current_path).to eq("/merchant")
    click_link ("Discounts")

    expect(current_path).to eq("/merchant/discounts")
  end

  it "displays discount information" do
    visit '/merchant/discounts'

    within "#discount-#{@discount_1.id}" do
      expect(page).to have_content(@discount_1.name)
      expect(page).to have_content(@discount_1.description)
      expect(page).to have_content(@discount_1.percent_off)
      expect(page).to have_content(@discount_1.minimum_quantity)
    end

    within "#discount-#{@discount_2.id}" do
      expect(page).to have_content(@discount_2.name)
      expect(page).to have_content(@discount_2.description)
      expect(page).to have_content(@discount_2.percent_off)
      expect(page).to have_content(@discount_2.minimum_quantity)
    end

    within "#discount-#{@discount_3.id}" do
      expect(page).to have_content(@discount_3.name)
      expect(page).to have_content(@discount_3.description)
      expect(page).to have_content(@discount_3.percent_off)
      expect(page).to have_content(@discount_3.minimum_quantity)
    end
  end
end
