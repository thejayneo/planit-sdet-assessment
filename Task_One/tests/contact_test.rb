require 'selenium-webdriver'
require 'rspec'

require_relative '../pages/contact'

describe 'Access Jupiter Toys contact page' do
    before(:each) do
        @driver = Selenium::WebDriver.for :chrome
    end

    after(:each) do
        @driver.quit
    end

    it 'returns confirmation on form submission' do
        form = ContactPage.new(@driver)
        form.fillForm()
        $alert_text = form.responseMessage.text
        expect($alert_text).to eq('Thanks John, we appreciate your feedback.')
    end
end