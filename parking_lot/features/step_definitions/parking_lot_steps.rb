

When(/^I park my car in the Valet Parking Lot for (.*)$/) do |duration|
  $parkcalc.select('Valet Parking')
  $parkcalc.enter_parking_duration(duration)
  pending
end

Then(/^I will have to pay (.*)$/) do |price|
  $parkcalc.parking_costs.should == price
  pending # express the regexp above with the code you wish you had
end
