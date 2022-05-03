require 'selenium-webdriver'
require_relative './JupiterToysTest'

class HomePage < JupiterToysTest
    def initialize(driver)
        @url = 'https://jupiter.cloud.planittesting.com/'

        super(driver)
        @driver.navigate.to @url
        @logger.info("Created#{self.class.name}")
    end
end