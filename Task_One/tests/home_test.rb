require 'selenium-webdriver'
require 'rspec'
require 'webdrivers'

require_relative '../pages/home'

describe 'Access Jupiter Toys site' do
    before(:each) do
        @driver = Selenium::WebDriver.for :chrome
    end

    after(:each) do
        @driver.quit
    end

    it 'navigates to shop page' do
        redirect = HomePage.new(@driver)
        redirect.startShopping()
        $shop_url = @driver.current_url
        expect($shop_url).to eq('https://jupiter.cloud.planittesting.com/#/shop')
    end
end