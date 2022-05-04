require 'selenium-webdriver'
require 'rspec'
require 'webdrivers'

require_relative '../pages/shop'

describe 'Access Jupiter Toys site' do
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

    it 'product Stuffed Frog available' do
        products = ShopPage.new(@driver)
        $result = products.productAvailable('Stuffed Frog')
        expect($result).to be(true)
    end

    it 'product Handmade Doll available' do
        products = ShopPage.new(@driver)
        $result = products.productAvailable('Handmade Doll')
        expect($result).to be(true)
    end

    it 'product Fluffy Bunny available' do
        products = ShopPage.new(@driver)
        $result = products.productAvailable('Fluffy Bunny')
        expect($result).to be(true)
    end

    it 'product Smiley Bear available' do
        products = ShopPage.new(@driver)
        $result = products.productAvailable('Smiley Bear')
        expect($result).to be(true)
    end

    it 'product Funny Cow available' do
        products = ShopPage.new(@driver)
        $result = products.productAvailable('Funny Cow')
        expect($result).to be(true)
    end

    it 'product Valentine Bear available' do
        products = ShopPage.new(@driver)
        $result = products.productAvailable('Valentine Bear')
        expect($result).to be(true)
    end

    it 'product Smiley Face available' do
        products = ShopPage.new(@driver)
        $result = products.productAvailable('Smiley Face')
        expect($result).to be(true)
    end
end