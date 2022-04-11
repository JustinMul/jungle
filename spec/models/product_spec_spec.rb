require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "All inputs given" do
    
      it "Creates a vaild product and returns no errors" do
        @category = Category.create(name: 'Apparel')
        @category.save
        @product = Product.create(name: 'shorts', price: 45, quantity: 8, category: @category)
        @product.save
        expect(@product).to be_valid
      end
    end
    describe "No Name" do
      it "throws an error saying name can't be blank" do
        @category = Category.create(name: 'Apparel')
        @category.save
        @product = Product.create(name: nil, price: 45, quantity: 8, category: @category)
        @product.save
        expect(@product.errors.full_messages).to include "Name can't be blank"
      end
    end
    describe "No Price" do
      it "returns an error saying name can't be blank" do
        @category = Category.create(name: 'Apparel')
        @category.save
        @product = Product.create(name: 'shorts', quantity: 8, category: @category)
        @product.save
        expect(@product.errors.full_messages).to include "Price is not a number"
      end
    end
    describe "No quantity" do
      it "returns an error saying quantity can't be blank" do
        @category = Category.create(name: 'Apparel')
        @category.save
        @product = Product.create(name: 'shorts', price: 45, quantity: nil, category: @category)
        @product.save
        expect(@product.errors.full_messages).to include "Quantity can't be blank"
      end
    end
    describe "No Category" do
      it "returns an error saying category can't be blank" do
        @category = Category.create(name: 'Apparel')
        @category.save
        @product = Product.create(name: 'shorts', price: 45, quantity: 8, category: nil)
        @product.save
        expect(@product.errors.full_messages).to include "Category can't be blank"
      end
    end
end
