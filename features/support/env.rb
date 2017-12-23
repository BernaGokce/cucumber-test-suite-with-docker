# ###############################PHANTOM JS SETTINGS######################################
require 'capybara'
require 'cucumber'
require 'rspec'
require 'capybara/poltergeist'
require 'selenium-webdriver'
require 'capybara/dsl'

Capybara.default_driver = :poltergeist

Capybara.register_driver :poltergeist do |app|
  options = {
      :js_errors => false,
      :timeout => 120,
      :debug => false,
      :window_size => [1280, 1024],
      :phantomjs_options => ['--load-images=no', '--disk-cache=false'],
      :inspector => true,
  }
  Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.ignore_hidden_elements = false
Capybara.run_server = false
Capybara.default_selector = :css
Capybara.default_max_wait_time = 10
Capybara.app_host = 'https://www.gittigidiyor.com/'

World(Capybara::DSL)


###############################CHROMEDRIVER SETTINGS######################################
# require 'cucumber'
# require 'rspec'
# require 'selenium-webdriver'
# require 'capybara'
# require 'capybara/dsl'
#
# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end
#
#
#
# Capybara.run_server = false
# Capybara.default_driver = :selenium
# Capybara.javascript_driver =:selenium
# Capybara.default_selector = :css
# Capybara.default_max_wait_time = 30
# #Capybara.ignore_hidden_elements = true
# #Capybara.exact = true
#
# Capybara.app_host = 'https://www.gittigidiyor.com/'
#
# World(Capybara::DSL)


