require 'capybara'
require 'capybara/cucumber'
require 'cucumber'
require 'rspec'
require 'webdrivers'
require 'pry'

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless') if ENV['HEADLESS']
options.add_argument('--disable-dev-shm-usage')
options.add_argument('--user-data-dir=/tmp/chrome-profile')
options.add_argument('--disable-gpu')

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, timeout: 30, options: options)
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 30
end