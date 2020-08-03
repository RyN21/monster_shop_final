Merchants add bulk discount rates for all of their inventory. These apply automatically in the shopping cart, and adjust the order_items price upon checkout.

1. Merchants need full CRUD functionality on bulk discounts, and will be accessed by a link on the merchant's dashboard.
1. You will implement a percentage based discount:
   - 5% discount on 20 or more items
1. A merchant can have multiple bulk discounts in the system.
1. When a user adds enough value or quantity of a single item to their cart, the bulk discount will automatically show up on the cart page.
1. A bulk discount from one merchant will only affect items from that merchant in the cart.
1. A bulk discount will only apply to items which exceed the minimum quantity specified in the bulk discount. (eg, a 5% off 5 items or more does not activate if a user is buying 1 quantity of 5 different items; if they raise the quantity of one item to 5, then the bulk discount is only applied to that one item, not all of the others as well)
1. When there is a conflict between two discounts, the greater of the two will be applied.
1. Final discounted prices should appear on the order's show page.


Steps for project:
1. create user stories. May need to adjust as I go.
  -user needs full CRUD functionality on all bulk discounts
1. add factory bot.


================================================================================

Merchant CRUD functions on Bulk Discounts

================================================================================
User Story 1, Discount index page

As a merchant employee
When on merchant dashboard
I see a link to discounts page
- I click on the discount link
- I expect page to be ("/merchant/discounts")


================================================================================
User Story 1.5 Discount index page displays attributes

As a merchant employee
visit ('/merchants/discounts')
the page should display
- name of the discount
- discount description
- discount percent
- discount minimum quantity in order to receive discount


================================================================================
User Story 2, Add bulk discount

As a merchant employee
When visiting merchant discount page
- I see a link to add new discount
- I click on "Add Discount"
- expect page to be ("/merchant/discounts/new")


================================================================================
User Story 3, Merchant employee add new discount

As a merchant employee
when visiting ("/merchant/discounts/new")
merchant can fill a form to create a new discount
form fields to fill out:
- discount name
- discount description
- discount percent
- discount minimum quantity in order to receive discount

Merchant then hits submit
then is redirected to merchants discount page where the discount is displayed


================================================================================
User Story 4, Discount show page

As a merchant employee
visit ("/merchants/discounts")
Discount name should link to discount show page
click discount name
page should show discount attributes
- name
- description
- percent of discount
- minimum quantity to receive discount
- date discount was made
- how many times the discount has been applied to an order


================================================================================
User Story 5, Discount edit page

As a merchant employee
when on a discount show page
there is an edit button that takes you to an edit page
- form is there to be edited
- form is pre populated with

There is a submit button to submit
after submitted, redirected to show page with the updated content
Button is also added to index page


================================================================================
User Story 6, Delete Discount

As a merchant employee
when on a discount show page
there is a delete button that removes the discount from the database
once deleted, merchant is redirected to discount index page
Button is also added to index page


================================================================================

VISITOR/USER INPUT


================================================================================
User Story 7, When a user places items in cart
and meets discount requirements
User's cart has discounts

As a visitor
When adding items to the cart
and adding the minimum quantity of an item
a bulk discount is added to that one item only
a flash message indicate bulk discount has been added


================================================================================
User Story 8, Bulk discount reflected in cart price

As a visitor
When adding items to the cart
and adding the minimum quantity of an item
and the discount is applied to thew item within the cart


================================================================================
User Story 9, User places order

As a visitor
with items in the cart with the applied discount
visitor must login to checkout
Order price reflects discount on that one item


================================================================================
User Story 10, Multiple discounts added to different items

As a user
when one or more item has met the required quantity to receive bulk discount
the correct price is reflected on each item


================================================================================
User Story 11, User can see original price along with discounted price

As a user
when an item has met the required quantity to receive bulk discount
the user can see
- new discounted price
- price without discount
- dollar amount the user is saving


================================================================================

Multiple discount conflict

================================================================================
User Story 12, Multiple discounts on one item

As a user
when the quantity of an item added to cart
meets the requirement of TWO or more discounts
- only one discount is applied to that item
- the discount with the greater percentage off overrides the other discount/s


================================================================================
User Story 13, Add total count discount method


================================================================================
User story 14, When merchant is destroyed

Discounts get destroyed with it


================================================================================
