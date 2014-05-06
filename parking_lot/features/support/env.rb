require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

$: << File.expand_path("../../lib", File.dirname(__FILE__))
require 'parking_lot'

driver = Selenium::WebDriver.for :chrome
driver.manage.timeouts.implicit_wait = 60
$parkcalc = ParkCalcPage.new(driver)

# after all
at_exit do
  driver.quit
  driver = nil
end
