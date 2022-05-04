require 'selenium-webdriver'
require 'logger'

class JupiterToysTest
    def initialize(driver)
        @driver = driver
        @logger = Logger.new(STDOUT)

        @driver.manage.window.maximize
        @driver.manage.timeouts.implicit_wait = 10
    end

    def getDriver
        @driver
    end

    def endDriver
        @driver.quit
    end
end