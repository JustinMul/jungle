# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Features
Upon logging in and going to the home page the user will be greated by a page like below.
![image](https://user-images.githubusercontent.com/95982839/163188445-67b5a6e0-2b2c-4878-81dc-ae9aebf9eb7e.png)

Here the user can click into specific items to get further details.
![image](https://user-images.githubusercontent.com/95982839/163188816-f5227298-1c44-4453-84c9-37b1e30bffcb.png)

If the user clicks the add button the cart at the top of the page will update. 
![image](https://user-images.githubusercontent.com/95982839/163189453-e06d8b48-ce75-4c36-9587-f62050c6b967.png)

Users can also filter by categories.
![image](https://user-images.githubusercontent.com/95982839/163189601-176839a1-7ad6-4d36-8bf0-3d73c188bfed.png)

When users are ready to checkout they can view their cart and make changes.
![image](https://user-images.githubusercontent.com/95982839/163189716-9d1bde6a-af69-4be1-9c15-28729492dc81.png)

Users will be greeted by a pop up pay window when readay to pay.
![image](https://user-images.githubusercontent.com/95982839/163189819-ad74f0fe-7091-4119-951b-3cdb53f18cbc.png)

Once a successful transaction has been completed users can review their order.
![image](https://user-images.githubusercontent.com/95982839/163189983-6a07075e-6ee3-4c85-b27a-776dce3bb0e9.png)

If a user is logged in as an admin they can also add products or categories.
![image](https://user-images.githubusercontent.com/95982839/163190933-546cde64-3a54-4435-9dd6-053d75f966cf.png)
![image](https://user-images.githubusercontent.com/95982839/163191061-7f6fe07e-c155-4718-877f-3fd21b04dd7b.png)


![image](https://user-images.githubusercontent.com/95982839/163190933-546cde64-3a54-4435-9dd6-053d75f966cf.png)

![image](https://user-images.githubusercontent.com/95982839/163189601-176839a1-7ad6-4d36-8bf0-3d73c188bfed.png)
