require 'pp'
require 'csv'
require_relative '../lib/commuter.rb'


raw_data = CSV.read('data/gschool_commute_data.csv', headers: false)

data = Commuter.new(raw_data).sort


pp Commuter.new(raw_data).inbound_trip_time("Nate",4,"Wednesday")

pp Commuter.new(raw_data).average_commute

pp Commuter.new(raw_data).fastest_walker
