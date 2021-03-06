require 'selenium-webdriver'
require_relative '../JupiterToysTest.rb'

class ShopPage < JupiterToysTest
    def initialize(driver)
        @url = 'https://jupiter.cloud.planittesting.com/#/shop'
        @products = 'product-title'

        super(driver)

        @driver.navigate.to @url
        return @logger.info("Created #{self.class.name}")
    end

    def productList
        products = @driver.find_elements(class: @products)
        @logger.warn("There are #{products.count} things for sale.")
        return products
    end

    def productCount
        $products = productList()
        return $products.count()
    end

    def productAvailable(productName)
        $itemPresent = false
        products = productList()
        products.each do |product|
            if product.text.include? productName
                $itemPresent = true
                break
            end
        end

        return $itemPresent
    end

    def buyProductOne
        $product = @driver.find_elements(class: 'btn-success')
        $product[0].click
    end

    def buyProductTwo
        $product = @driver.find_elements(class: 'btn-success')
        $product[1].click
        $product[1].click
    end
end