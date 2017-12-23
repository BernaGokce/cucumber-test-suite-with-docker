Given(/^I am GittiGidiyor\.com home page$/) do
 find($home_page["daily_opportunity"], visible:true)
end

And(/^Advertisement pop up is opened$/) do
  pop_up = find($pop_up["advertisement_popup"], visible:true)
  if pop_up
    find($pop_up["close_button"], wait: 2).click
  end
end

When(/^I search "([^"]*)"$/) do |product|
  search_product(product)
end

Then(/^"([^"]*)" product page is opened$/) do |product_name|
  product_page_is_opened(product_name)
end

And(/^I see product price$/) do
  ##CHROMEDRIVER##
  #$product_page_price = find($product_page["price"]).text.split(" ").first

  ##PHANTOMDRIVER##
  $product_page_price = all($product_page["price"])[1].text.split(" ").first
end

And(/^I go to the "([^"]*)"\. page$/) do |page_number|
  change_page_number(page_number)
  puts(page.current_url)
end

And(/^I choose "([^"]*)"\. element on the page$/) do |product|
  choose_product_from_list(product)
  puts(page.current_url)
end

And(/^I add the product in to the shopping box$/) do
  add_shopping_box
  puts(page.current_url)
end


Then(/^Shopping box is opened$/) do
  puts(page.current_url)
  shopping_page_is_opened
  puts(page.current_url)
end


And(/^fixpack popup is opened$/) do
  pop_up = find($fixpack["fixpack_popup"], visible:true)
  if pop_up
    all($fixpack["close_button"], wait:2)[0].click
  end
  puts(page.current_url)
end

And(/^I check product price is correct$/) do
  shopping_page_price = find($shopping_box["price"]).text.split(" ").first
  shopping_page_price == $product_page_price
  puts(page.current_url)
end


And(/^I check total price$/) do
  total_price = find($shopping_box["total_price"]).text.split(" ").first
  shopping_page_price = all($shopping_box["price"])[1].text.split(" ").first
  remain = total_price.to_f - $product_page_price.to_f
  remain == shopping_page_price.to_f
  puts(page.current_url)
end


And(/^I delete product which is "([^"]*)"\. in the shopping box$/) do |number|
    delete_product(number)
    puts(page.current_url)
end

Then(/^I continue to buy products$/) do
  continue_to_shop
  puts(page.current_url)
end

And(/^I close campaing pop up$/) do
  pop_up = find($campaing_pop_up["close_button"], visible:true)
  if pop_up
    find($campaing_pop_up["close_button"]).click
  end
  puts(page.current_url)
end

And(/^I check new total price$/) do
  total_price = find($shopping_box["total_price"]).text.split(" ").first
  shopping_page_price = all($shopping_box["price"])[0].text.split(" ").first
  total_price == shopping_page_price
  puts(page.current_url)
end

And(/^Shopping box should be empty$/) do
  find($shopping_box["empty_shopping_box"], visible: true)
  puts(page.current_url)
end

Then(/^I delete all element from shopping box$/) do
  delete_all_product
  puts(page.current_url)
end

Then(/^Product page is opened$/) do
  find($product_page["buy_now"],wait: 5)
  find($product_page["buy_now"], visible:true)
  puts(page.current_url)
end

And(/^I check there is only "([^"]*)" element left$/) do |element_number|
  remain_element = find($shopping_box["remain_element_number"]).text
  if remain_element == element_number
    fail("Product is not deleted!")
  end
  sleep 2
  puts(page.current_url)
end
