require 'selenium-webdriver'
require_relative '../JupiterToysTest'

class LoginPage < JupiterToysTest
    def initialize(driver)
        @url = 'https://jupiter.cloud.planittesting.com/'

        super(driver)
        @driver.navigate.to @url
        @logger.info("Created#{self.class.name}")
    end

    def loginPrompt
        button = @driver.find_element(id: 'nav-login')
        button.click()
    end

    def loginFill
        user = @driver.find_element(id: 'loginUserName')
        user.send_keys('test')
        password = @driver.find_element(id: 'loginPassword')
        password.send_keys('test')
        button =  @driver.find_element(class: 'btn-primary')
        button.click
    end

    def loginError
        error = @driver.find_element(id: 'login-error')
    end
end