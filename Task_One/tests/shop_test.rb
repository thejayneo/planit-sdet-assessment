require 'selenium-webdriver'
require 'rspec'

require_relative '../pages/shop'

describe 'Access Jupiter Toys shop page' do
    before(:each) do
        @driver = Selenium::WebDriver.for :chrome
    end

    after(:each) do
        @driver.quit
    end

    it 'has 8 types of products' do
        products = ShopPage.new(@driver)
        $result = products.productCount
        expect($result).to be(8)
    end

    it 'product Teddy Bear available' do
        products = ShopPage.new(@driver)
        $result = products.productAvailable('Teddy Bear')
        expect($result).to be(true)
    end

    it 'adds an item to cart' do
        buy = ShopPage.new(@driver)
        buy.buyProductOne
        $cart_count = @driver.find_element(class: 'cart-count')
        expect($cart_count.text).to eq('1')
    end

    it 'adds 2 different items to cart' do
        buy = ShopPage.new(@driver)
        buy.buyProductOne
        buy.buyProductTwo
        $cart_count = @driver.find_element(class: 'cart-count')
        expect($cart_count.text).to eq('3')
    end
end