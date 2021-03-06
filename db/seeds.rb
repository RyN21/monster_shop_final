# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bike_shop           = Merchant.create(name: 'Megans Bike Shop', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
dog_shop            = Merchant.create(name: 'Brians Dog Shop' , address: '125 Main St', city: 'Denver', state: 'CO', zip: 80218)

#bike_shop items
tire                = bike_shop.items.create(name: "Tire"     , description: "Really nice", price: 10, inventory: 150, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588")
handlebar           = bike_shop.items.create(name: "Handlebar", description: "Great bars" , price: 10, inventory: 130, image: "https://i0.wp.com/rinascltabike.com/wp-content/uploads/2019/04/Rinasclta-integrated-carbon-handlebar.jpg")

#dog_shop items
pull_toy            = dog_shop.items.create(name: "Pull Toy"  , description: "Great toy"  , price: 10, inventory: 224, image: "http://lovencaretoys.com/image/cache/dog/tug-toy-dog-pull-9010_2-800x800.jpg")
dog_bone            = dog_shop.items.create(name: "Dog Bone"  , description: "Great toy"  , price: 10, inventory: 241, image: "https://img.chewy.com/is/image/catalog/54226_MAIN._AC_SL1500_V1534449573_.jpg")

#bike_shop discounts
ten_percent_off_bs  = bike_shop.discounts.create(name: "10 percent off!", description: "Save big when you buy bulk", percent_off: 10 , minimum_quantity: 20)
five_percent_off_bs = bike_shop.discounts.create(name: "5 percent off!" , description: "Save big when you buy bulk", percent_off: 5  , minimum_quantity: 10)

#dog_shop discounts
ten_percent_off_ds  = dog_shop.discounts.create(name: "10 percent off!" , description: "Save big when you buy bulk", percent_off: 10 , minimum_quantity: 20)
five_percent_off_ds = dog_shop.discounts.create(name: "5 percent off!"  , description: "Save big when you buy bulk", percent_off: 5  , minimum_quantity: 10)

#users
admin_user          = User.create(name: "Ryan L",   address: "123 7th Ave.", city: "Denver", state: "CO", zip: "80121" , email: 'admin@test.com'   , password: "123456", role: 2)
user                = User.create(name: "Reija L",  address: "123 7th Ave.", city: "Denver", state: "CO", zip: "80121" , email: 'user@test.com'    , password: "123456", role: 0)
merch_user          = bike_shop.users.create(name: "Olivia L", address: "123 7th Ave.", city: "Denver", state: "CO", zip: "80121" , email: 'merchant@test.com', password: "123456", role: 1)

#orders
order_1            = user.orders.create
order_2            = user.orders.create

#order items
order_1.order_items.create(item: handlebar, price: tire.price     , quantity: 1)
order_1.order_items.create(item: tire     , price: tire.price     , quantity: 6)
order_2.order_items.create(item: handlebar, price: handlebar.price, quantity: 3)
order_2.order_items.create(item: pull_toy , price: pull_toy.price , quantity: 7)
