

When(/^I park my car in the Valet Parking Lot for (.*)$/) do |duration|
  $parkcalc.select('Valet Parking')
  $parkcalc.enter_parking_duration(duration)
  pending
end

Then(/^I will have to pay \$ (\d+)\.(\d+)$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end
