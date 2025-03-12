require 'capybara'
require 'capybara/cucumber'
require 'cucumber'
require 'rspec'
require 'selenium-webdriver'
require 'pry'

options = Selenium::WebDriver::Chrome::Options.new
# Pastikan mode headless aktif di CI/CD
options.add_argument('--headless') unless ENV['CI'].nil? # Selalu headless di CI/CD
options.add_argument('--disable-dev-shm-usage')
options.add_argument('--disable-gpu')
options.add_argument('--no-sandbox') # Tambahkan opsi no-sandbox agar tidak crash
options.add_argument('--disable-popup-blocking')
options.add_argument('--disable-infobars')
options.add_argument('--remote-debugging-port=9222')
options.add_argument('--user-data-dir=/tmp/chrome-user-data') # Pastikan sesi unik

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app,browser: :chrome, timeout: 30, options: options)
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 30
end