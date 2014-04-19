# -*- coding: utf-8 -*-
require 'rubygems'
require 'selenium/client'
require 'rspec/expectations'

selenium_driver = Selenium::Client::Driver.new(
   :host => 'localhost',
   :port => '4444',
   :browser => '*firefox',
   :url => 'http://localhost:4567/parkcalc',
   :timeout_in_second => 60
)

selenium_driver.start_new_browser_session
$parkcalc = ParkCalcPage.new(selenium_driver)

at_exit do
   selenium_driver.close_current_browser_session
end
