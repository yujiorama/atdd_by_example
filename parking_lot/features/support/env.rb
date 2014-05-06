# -*- coding: utf-8 -*-
require 'rubygems'
require 'rspec/expectations'
require 'selenium/client'

$: << File.expand_path("../../lib", File.dirname(__FILE__))
require 'parking_lot'

driver = Selenium::Client::Driver.new(
    :host => 'localhost',
    :port => 4444,
    :url => 'http://parkcalc.heroku.com',
    :browser => '*webdriver'
)

driver.start_new_browser_session
$parkcalc = ParkCalcPage.new(driver)

# after all
at_exit do
  driver.quit
end
