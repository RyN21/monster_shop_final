require 'rails_helper'

RSpec.describe "Discount index page" do
  before :each do
    @merchant = create(:merchant)
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

  it "merchant has link to discount index page" do

    click_link ("Discounts")

    expect(current_path).to eq("/merchant/discounts")
  end

  it "displays discount information" do

    visit '/merchant/discounts'

    expect(page).to have_content()
  end
end



User Story 1.5 Discount index page displays attributes

As a merchant employee
visit ('/merchants/discounts')
the page should display
- name of the discount
- discount description
- discount percent
- discount minimum quantity in order to receive discount
