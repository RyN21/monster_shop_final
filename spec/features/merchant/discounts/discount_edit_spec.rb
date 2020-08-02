require 'rails_helper'

RSpec.describe "Edit discount" do
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

    visit '/merchant/discounts'
  end

  it "has a link to a edit discount page from INDEX page" do
    within "#discount-#{@discount_1.id}" do
      click_button "Edit"
    end

    expect(current_path).to eq("/merchant/discounts/#{@discount_1.id}/edit")
  end

  it "has a link to a edit discount page from SHOW page" do
    within "#discount-#{@discount_1.id}" do
      click_link "#{@discount_1.name}"
    end
    # save_and_open_page
    click_button "Edit"

    expect(current_path).to eq("/merchant/discounts/#{@discount_1.id}/edit")
  end

  it "has a pre populated form to edit discount information" do
    visit "/merchant/discounts/#{@discount_1.id}"

    click_button "Edit"

    fill_in 'Name', with: @discount_1.name
    fill_in 'Description', with: @discount_1.description
    fill_in 'Percent off', with: @discount_1.percent_off
    fill_in 'Minimum quantity', with: 30

    click_button "Submit"

    expect(current_path).to eq("/merchant/discounts/#{@discount_1.id}")

    expect(page).to have_content(@discount_1.name)
    expect(page).to have_content("30")
  end
end
