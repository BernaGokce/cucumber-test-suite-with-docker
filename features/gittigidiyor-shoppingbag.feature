Feature: Checking shopping bag functionality
  As a GittiGidiyor.com user
  I want to add products to the shopping box
  So that I can check the price of the products

  @check_price_1
  Scenario: Check price is correct for one product
    Given I am GittiGidiyor.com home page
    #And Advertisement pop up is opened
    When I search "televizyon"
    Then "televizyon" product page is opened
    When I go to the "2". page
    And I choose "5". element on the page
    Then Product page is opened
    And I see product price
    When I add the product in to the shopping box
    And fixpack popup is opened
    Then Shopping box is opened
    And I check product price is correct

 @check_price_2
 Scenario: Check price is correct for multiple products
    Given I am GittiGidiyor.com home page
    #And Advertisement pop up is opened
    When I search "televizyon"
    Then "televizyon" product page is opened
    When I go to the "2". page
    And I choose "5". element on the page
    Then Product page is opened
    When I add the product in to the shopping box
    And fixpack popup is opened
    Then Shopping box is opened
    Then I continue to buy products
    #And I close campaing pop up
    When I search "iphone"
    Then "iphone" product page is opened
    And I choose "5". element on the page
    Then Product page is opened
    And I see product price
    And I add the product in to the shopping box
    #And fixpack popup is opened
    Then Shopping box is opened
    And I check total price
    And I delete product which is "2". in the shopping box
    And I check there is only "1" element left
    And I check new total price
    And I delete product which is "1". in the shopping box
    #Then I delete all element from shopping box
    And Shopping box should be empty


