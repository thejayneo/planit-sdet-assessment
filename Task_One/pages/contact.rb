require 'selenium-webdriver'
require_relative '../JupiterToysTest.rb'

class ContactPage < JupiterToysTest
    def initialize(driver)
        @url = 'https://jupiter.cloud.planittesting.com/#/contact'

        super(driver)

        @driver.navigate.to @url
        return @logger.info("Created #{self.class.name}")
    end

    def fillForm
        first_name = @driver.find_element(id: 'forename')
        first_name.send_keys 'John'

        last_name = @driver.find_element(id: 'surname')
        last_name.send_keys 'Smith'

        email = @driver.find_element(id: 'email')
        email.send_keys 'john.smith@emailprovider.com'
        
        telephone = @driver.find_element(id: 'telephone')
        telephone.send_keys '0235987265'

        message = @driver.find_element(id: 'message')
        message.send_keys 'I tried to order the limited edition race car but I can not find it'

        submit_button = @driver.find_element(class: 'btn-primary')
        submit_button.click
    end

    def responseMessage
        @driver.find_element(class: 'alert-success')
    end
end