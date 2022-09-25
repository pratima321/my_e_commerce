# README

This is an eCommerce application for managing cart and cart items for application users. Below are the API's that are currently available in this repo.


## Add Item to Cart: 

##### Method: POST

###### Request Example : ``` localhost:3000/cart_items/add_item_to_cart?user_id=1&variation_id=1&item_id=1 ```

##### Description: 

It allows a user to add any item from the menu to a cart. If the cart is not created, then this method also creates a new cart for the user and then adds the item to the cart and stores it in the cart items model. 


If the item is already added into the cart, then it will update the quantity and total_price of the cart item.

If the item has variations, then the price of the variation becomes the base price of the cart item.

If the item has addons, then the addon price is added to the base price of the cart item. Please keep in mind the min / max conditions for addons.

If the item has both variations and addons, then the variation price + addon price becomes the base price of the item.

If the user selects different  combinations of variations and addons, then a new cart item is created.

## Remove Item from Cart:

##### Method: POST

###### Request Example : ``` localhost:3000/cart_items/remove_item_from_cart?user_id=1&item_id=1&variation_id=1 ```

##### Description: 

It allows the user to remove a specific cart item. 


If there are multiple quantities of the same item, then only the quantity reduces and the pieces are updated.


If there are multiple items with variations and addons, then the correct item should be removed 


## Cart Details: 


##### Method: GET

###### Request Example : ``` localhost:3000/carts?user_id=1 ```

##### Description: 

It returns with the final details of the cart of a user with the final amount that he needs to pay and all the items that are added to the cart.


## How To Install:

```
bundle install
bundle exec rails db:create db:migrate
```
Please do seed data. Please run below command to get menue information in your data base.

```
bundle exec rails db:seed
```
Finally run the server to start adding items to the cart.

```
rails s
```

### Database structure for better understanding:

<img width="1086" alt="Screen Shot 2022-09-25 at 10 53 13 PM" src="https://user-images.githubusercontent.com/16492609/192159515-3d4c597a-73d2-480c-918f-4d9aceb26aa2.png">

