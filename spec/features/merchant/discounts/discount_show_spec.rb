require 'rails_helper'

RSpec.describe "Discount show page" do
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
  end

  it "Discount show page shows discount's attributes" do
    visit 'merchant/discounts'

    click_on @discount_1.name

    expect(page).to have_content(@discount_1.name)
    expect(page).to have_content(@discount_1.description)
    expect(page).to have_content(@discount_1.percent_off)
    expect(page).to have_content(@discount_1.minimum_quantity)
    expect(page).to have_content(@discount_1.date_created)
    # expect(page).to have_content(@discount_1.total_count_it_been_applied)
  end
end
