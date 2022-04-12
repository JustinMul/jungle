require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature do


  before :each do

    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

   scenario "Navigate from the home page to the product detail page" do
    visit root_path
    first('article.product').click_on("Details")
    
    # # commented out b/c it's for debugging only
    # save_screenshot

    expect(page).to have_css 'section.products-show', count: 1
  end
end
