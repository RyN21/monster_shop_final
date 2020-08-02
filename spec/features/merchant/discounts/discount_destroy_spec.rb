require 'rails_helper'

RSpec.describe "Destroy discount" do
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

  it "can has delete button on discount INDEX page" do
    within "#discount-#{@discount_1.id}" do
      click_button "Delete Discount"
    end

    expect(current_path).to eq("/merchant/discounts")
  end

  it "can has delete button on discount SHOW page" do
    within "#discount-#{@discount_1.id}" do
      click_link "#{@discount_1.name}"
    end
    # save_and_open_page
    click_button "Delete Discount"

    expect(current_path).to eq("/merchant/discounts")
  end

end
