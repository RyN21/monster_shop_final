# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
#   brian = Merchant.create!(name: 'Brians Bagels', address: '125 Main St', city: 'Denver', state: 'CO', zip: 80218)
#   megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
#   megan.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
#   brian.items.create!(name: 'Hippo', description: "I'm a Hippo!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )

# require "factory_bot_rails"
# include FactoryBot::Syntax::Methods
#
# Merchant.destroy_all
# Item.destroy_all
# User.destroy_all
# Discount.destroy_all
# Order.destroy_all
#
#
# #merchants
# bike_shop           = create(:merchant , name: "Meg's Bike Shop")
# dog_shop            = create(:merchant , name: "Brian's Dog Shop")
#
# #bike_shop items
# tire                = create(:item     , merchant: bike_shop , name: "Gatorskins" , image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588"  , inventory: 1100)
#
# #dog_shop items
# pull_toy            = create(:item     , merchant: dog_shop  , name: "Pull Toy"   , image: "http://lovencaretoys.com/image/cache/dog/tug-toy-dog-pull-9010_2-800x800.jpg" , inventory: 224)
# dog_bone            = create(:item     , merchant: dog_shop  , name: "Dog Bone"   , image: "https://img.chewy.com/is/image/catalog/54226_MAIN._AC_SL1500_V1534449573_.jpg", inventory: 241)
# random              = create(:item     , merchant: dog_shop)
#
# #bike_shop discounts
# ten_percent_off_bs  = create(:discount , bike_shop , percent_off: 10 , minimum_quantity: 20)
# five_percent_off_bs = create(:discount , bike_shop , percent_off: 5  , minimum_quantity: 10)
#
# #dog_shop discounts
# ten_percent_off_ds  = create(:discount , dog_shop , percent_off: 10 , minimum_quantity: 20)
# five_percent_off_ds = create(:discount , dog_shop , percent_off: 5  , minimum_quantity: 10)
#
# #users
# admin_user          = create(:user     , email: 'admin@test.com',  role: 2 )
# user                = create(:user     , email: 'user@test.com')
# merch_user          = create(:user     , merchant: bike_shop, email: 'merchant@test.com', role: 1 )
#
# #orders
# order_1             = create(:order    , user: user, status: 1)
# order_2             = create(:order    , user: user)
# order_3             = create(:order    , user: user, status: 2)
# order_4             = create(:order    , user: user, status: 1)
# order_5             = create(:order    , user: user, status: 3)
