require 'selenium-webdriver'
require 'rspec'
require 'webdrivers'

require_relative '../pages/cart'
require_relative '../pages/shop'

describe 'Access Jupiter Toys cart page' do
    before(:each) do
        @driver = Selenium::WebDriver.for :chrome
    end

    after(:each) do
        @driver.quit
    end

    it 'button navigates to shop page when cart is empty' do
        redirect = CartPage.new(@driver)
        redirect.startShopping()
        shop_url = @driver.current_url
        expect(shop_url).to eq('https://jupiter.cloud.planittesting.com/#/shop')
    end

    it 'adds 2 different items to cart' do
        buy = ShopPage.new(@driver)
        buy.buyProductOne
        buy.buyProductTwo
        cart = CartPage.new(@driver)
        expect(cart.count).to be(2)
    end

    it 'removes item from cart' do
        buy = ShopPage.new(@driver)
        buy.buyProductOne
        buy.buyProductTwo
        cart = CartPage.new(@driver)
        cart.remove
        expect(cart.count).to be(1)
    end
    
    it 'empties cart' do
        buy = ShopPage.new(@driver)
        buy.buyProductOne
        buy.buyProductTwo
        cart = CartPage.new(@driver)
        cart.removeAll
        expect(cart.count).to be(0)
    end

    it 'successful checkout' do
        buy = ShopPage.new(@driver)
        buy.buyProductOne
        cart = CartPage.new(@driver)
        cart.checkout
        cart.orderSuccess.text
        expect(cart.orderSuccess.text).to include('Thanks John, your order has been accepted.')
    end
end