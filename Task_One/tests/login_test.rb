require 'selenium-webdriver'
require 'rspec'

require_relative '../pages/login'

describe 'Access Jupiter Toys login page' do
    before(:each) do
        @driver = Selenium::WebDriver.for :chrome
    end

    after(:each) do
        @driver.quit
    end

    it 'returns error message on incorrect login' do
        login = LoginPage.new(@driver)
        login.loginPrompt
        login.loginFill
        $error = login.loginError.text
        expect($error).to eq('Your login details are incorrect')
    end
end