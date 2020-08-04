##  Users have multiple addresses

#### General Goal

Users will have more than one address associated with their profile. Each address will have a nickname like "home" or "work". Users will choose an address when checking out.

#### Completion Criteria

1. When a user registers they will still provide an address, this will become their first address entry in the database and nicknamed "home".
1. Users need full CRUD ability for addresses from their Profile page.
1. An address cannot be deleted or changed if it's been used in a "shipped" order.
1. When a user checks out on the cart show page, they will have the ability to choose one of their addresses where they'd like the order shipped.
1. If a user deletes all of their addresses, they cannot check out and see an error telling them they need to add an address first. This should link to a page where they add an address.
1. If an order is still pending, the user can change to which address they want their items shipped.

#### Implementation Guidelines

1. Existing tests should still pass. Since you will need to make major changes to your database schema, you will probably break **many** tests. It's recommended that you focus on the completion criteria described above before going back and refactoring your code so that your existing tests still work.
1. Every order show page should display the chosen shipping address.
1. Statistics related to city/state should still work as before.


================================================================================

Users have multiple addresses:

================================================================================
[]
User Story 1, User can add two addresses when registering

As a visitor
When I click on register
I see two address forms to fill out
The second address form is optional
- street address
- city
- state
- zip
- address nickname (e.g. "home", "work".)
I click submit
User has two addresses saved

NOTE:
- possibly save addresses as hashes


================================================================================
[]
User Story 2, User can add second address after registered

As an existing user with on address saved
I can click a button on the profile page to add a new address
I am redirected to the edit page
There is an additional optional address form
fill form
hit submit
User now has two addresses saved


================================================================================
[]
User Story 3, User can change or delete address IF it has NOT been used

as a user
there is an edit button for profile
if address has been used in a 'shipped' order, address cannot be deleted
if address has been used in a 'shipped' order, address cannot be edited

else, a form is available for a new address
and, an optional address form is available and can be left blank
if left blank, new user input becomes saved


================================================================================
[]
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
[]
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
[]
User Story 6, Delete Discount

As a merchant employee
when on a discount show page
there is a delete button that removes the discount from the database
once deleted, merchant is redirected to discount index page
Button is also added to index page


================================================================================

VISITOR/USER INPUT


================================================================================
[]
User Story 7, When a user places items in cart
and meets discount requirements
User's cart has discounts

As a visitor
When adding items to the cart
and adding the minimum quantity of an item
a bulk discount is added to that one item only
a flash message indicate bulk discount has been added


================================================================================
[]
User Story 8, Bulk discount reflected in cart price

As a visitor
When adding items to the cart
and adding the minimum quantity of an item
and the discount is applied to the item within the cart


================================================================================
[]
User Story 9, User places order

As a visitor
with items in the cart with the applied discount
visitor must login to checkout
Order price reflects discount on that one item


================================================================================
[]
User Story 10, Multiple discounts added to different items

As a user
when one or more item has met the required quantity to receive bulk discount
the correct price is reflected on each item


================================================================================
[]
User Story 11, User can see money saved along with discounted price

As a user
when an item has met the required quantity to receive bulk discount
the user can see
- new discounted price
- dollar amount the user is saving


================================================================================

Multiple discount conflict

================================================================================
[]
User Story 12, Multiple discounts on one item

As a user
when the quantity of an item added to cart
meets the requirement of TWO or more discounts
- only one discount is applied to that item
- the discount with the greater percentage off overrides the other discount/s


================================================================================
[]
User Story 13, Add total count discount method


================================================================================
[]
User story 14, When merchant is destroyed

Discounts get destroyed with it


================================================================================
