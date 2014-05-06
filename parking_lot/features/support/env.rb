# -*- coding: utf-8 -*-
require 'rubygems'
require 'rspec/expectations'
require 'selenium/client'

$: << File.expand_path("../../lib", File.dirname(__FILE__))
require 'parking_lot'

ENV['PATH'] = ENV['PATH'] + ':' + File.expand_path("../../bin", File.dirname(__FILE__))
$driver = Selenium::Client::Driver.new(
    :host => 'localhost',
    :port => 4444,
    :browser => "*googlechrome",
    :url => 'http://parkcalc.heroku.com',
    :tieout_in_second => 60
)

$driver.start_new_browser_session
$parkcalc = ParkCalcPage.new($driver)

# after all
at_exit do
  $driver.close_current_browser_session
end
