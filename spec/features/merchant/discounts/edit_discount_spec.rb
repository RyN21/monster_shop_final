require 'rails_helper'

RSpec.describe "Edit discount" do
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

    visit '/merchant/discounts'
  end

  it "has a link to a edit discount page from INDEX page" do
    within "#discount-#{@discount_1.id}" do
      click_link "Edit"
    end

    expect(current_path).to eq("merchant/discounts/#{@discount_1.id}/edit")
  end

  it "has a link to a edit discount page from SHOW page" do
    within "#discount-#{@discount_1.id}" do
      click_link "#{@discount_1.name}"
    end

    click_link "Edit"

    expect(current_path).to eq("merchant/discounts/#{@discount_1.id}/edit")
  end

  it "has a pre populated form to edit discount information" do
    within "#discount-#{@discount_1.id}" do
      click_link "Edit"
    end

    fill_in 'Name', with: "5% Bulk Discount"
    fill_in 'Description', with: "Get 5% of any item when you purchase 20 or more of that item!"
    fill_in 'Percent off', with: 5
    fill_in 'Minimum quantity', with: 30

    click_button "Submit"

    expect(current_path).to eq("/merchant/discounts/#{@discount_1.id}")

    expect(page).to have_content(@discount_1.name)
    expect(page).to have_content("30")
  end
end
