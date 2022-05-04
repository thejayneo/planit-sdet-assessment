require 'selenium-webdriver'
require_relative '../JupiterToysTest'

class CartPage < JupiterToysTest
    def initialize(driver)
        @url = 'https://jupiter.cloud.planittesting.com/#/cart'

        super(driver)
        @driver.navigate.to @url
        @logger.info("Created#{self.class.name}")
    end

    def startShopping
        button = @driver.find_element(class: 'btn-success')
        button.click()
    end
    
    def count
        cart_count = @driver.find_elements(class: 'cart-item').count()
        return cart_count
    end

    def remove
        remove_item = @driver.find_element(class: 'remove-item')
        remove_item.click
        confirm_remove = @driver.find_element(link_text: 'Yes')
        confirm_remove.click
    end

    def removeAll
        remove_item = @driver.find_element(link_text: 'Empty Cart')
        remove_item.click
        confirm_remove = @driver.find_element(link_text: 'Yes')
        confirm_remove.click
    end

    def checkout
        checkout_button = @driver.find_element(link_text: 'Check Out')
        checkout_button.click

        first_name = @driver.find_element(id: 'forename')
        first_name.send_keys 'John'

        email = @driver.find_element(id: 'email')
        email.send_keys 'john.smith@emailprovider.com'

        address = @driver.find_element(id: 'address')
        address.send_keys '101 Dalmation Ave, Cheshire, VA 21234'

        card_type = @driver.find_element(id: 'cardType')
        choose = Selenium::WebDriver::Support::Select.new(card_type)
        choose.select_by(:text, "Mastercard")

        card_number = @driver.find_element(id: 'card')
        card_number.send_keys '1234 5678 9012 3456'

        submit_button = @driver.find_element(class: 'btn-primary')
        submit_button.click
    end

    def orderSuccess
        @driver.find_element(class: 'alert-success')
    end
end