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
end