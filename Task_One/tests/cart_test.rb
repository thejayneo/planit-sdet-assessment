require 'selenium-webdriver'
require 'rspec'
require 'webdrivers'

require_relative '../pages/cart'
require_relative '../pages/shop'

describe 'Access Jupiter Toys site' do
    before(:each) do
        @driver = Selenium::WebDriver.for :chrome
    end

    after(:each) do
        @driver.quit
    end

    it 'navigates to shop page' do
        redirect = CartPage.new(@driver)
        redirect.startShopping()
        $shop_url = @driver.current_url
        expect($shop_url).to eq('https://jupiter.cloud.planittesting.com/#/shop')
    end

    # it 'adds 2 of the first item to cart' do
    # end

    # it 'adds 1 of the second item to cart' do
    # end
end