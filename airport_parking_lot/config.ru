require 'rubygems'
require 'bundler'
Bundler.require
require File.join(File.dirname(__FILE__), 'lib/parking_lot_calculator.rb')

run ParkingLotCalculator
