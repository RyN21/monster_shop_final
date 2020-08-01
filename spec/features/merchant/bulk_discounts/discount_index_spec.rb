require 'rails_helper'

RSpec.describe "Discount index page" do
  before :each do
    @merchant = create(:merchant)
    @merch_user = create(:user, merchant: @merchant, email: 'merchant@test.com', role: 1)

    visit '/login'
    within  "form" do
      fill_in :email,	with: 'merchant@test.com'
      fill_in :password,	with: @merch_user.password
      click_on 'Log In'
    end
  end
  it "merchant has link to discount index page" do

    click_link ("Discounts")

    expect(current_path).to eq("/merchant/discounts")
  end
end
