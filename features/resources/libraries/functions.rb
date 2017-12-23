def search_product(product)
  find($home_page["search_field"]).set product
  find($home_page["search_button"]).click
end

def product_page_is_opened(product_name)
  expect(page).to have_selector($product_page["product"],text: product_name)
end

def shopping_page_is_opened
  expect(page).to have_selector($shopping_box["submit_button"])
end

def change_page_number(page_number)
  find("a[href='/arama/?k=televizyon&sf=#{page_number}']", text: page_number).click
  url = page.current_url
  if !url.include? page_number
    "Page number is not #{page_number}!"
  end
end

def choose_product_from_list(product)
  all($product_page["product_in_list"])[product.to_i - 1].click
end

def add_shopping_box
  find($product_page["add_basket"]).click
end

def continue_to_shop
  find($common["continue_shopping"]).click
end

def delete_product(number)
  all($shopping_box["delete"], wait: 10)[number.to_i - 1].click
end

def delete_all_product
  find($shopping_box["delete_all_products"]).click
end
