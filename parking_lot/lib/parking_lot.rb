
class ParkCalcPage
  @@durationMap = {
    '30 minutes' => ['2010/04/05', '12:00:00', 'AM', '2010/04/05', '12:30', 'AM'],
    '1 hours' => ['2010/04/05', '09:00:00', 'AM', '2010/04/05', '10:00:00', 'AM'],
    '1 hours 30 minutes' => ['2010/04/05', '09:00:00', 'AM', '2010/04/05', '10:30:00', 'AM'],
    '2 hours' => ['2010/04/05', '09:00:00', 'AM', '2010/04/05', '11:00:00', 'AM'],
    '3 hours' => ['2010/04/05', '12:00:00', 'AM', '2010/04/05', '03:00:00', 'AM'],
    '3 hours 30 minutes' => ['2010/04/05', '12:00:00', 'AM', '2010/04/05', '03:30:00', 'AM'],
    '4 hours' => ['2010/04/05', '12:00:00', 'AM', '2010/04/05', '04:00:00', 'AM'],
    '5 hours' => ['2010/04/05', '12:00:00', 'AM', '2010/04/05', '05:00:00', 'AM'],
    '5 hours 1 minute' => ['2010/04/05', '12:00:00', 'AM', '2010/04/05', '05:01', 'AM'],
    '6 hours' => ['2010/04/05', '12:00:00', 'AM', '2010/04/05', '06:00:00', 'AM'],
    '12 hours' => ['2010/04/05', '12:00:00', 'AM', '2010/04/05', '12:00:00', 'PM'],
    '12 hours 30 minutes' => ['2010/04/05', '12:00:00', 'AM', '2010/04/05', '12:30:00', 'PM'],
    '24 hours' => ['2010/04/05', '12:00:00', 'AM', '2010/04/06', '12:00:00', 'AM'],
    '1 day 1 minute' => ['2010/04/05', '12:00:00', 'AM', '2010/04/06', '12:01', 'AM'],
    '1 day 30 minute' => ['2010/04/05', '12:00:00', 'AM', '2010/04/06', '12:30', 'AM'],
    '1 day 1 hour' => ['2010/04/05', '12:00:00', 'AM', '2010/04/06', '01:00', 'AM'],
    '1 day, 1 hour' => ['2010/04/05', '12:00:00', 'AM', '2010/04/06', '01:00:00', 'AM'],
    '1 day, 3 hours' => ['2010/04/05', '12:00:00', 'AM', '2010/04/06', '03:00', 'AM'],
    '1 day, 5 hours' => ['2010/04/05', '12:00:00', 'AM', '2010/04/06', '05:00', 'AM'],
    '3 days' => ['2010/04/05', '12:00:00', 'AM', '2010/04/08', '12:00:00', 'AM'],
    '6 days' => ['2010/04/05', '12:00:00', 'AM', '2010/04/11', '12:00:00', 'AM'],
    '6 days, 1 hour' => ['2010/04/05', '12:00:00', 'AM', '2010/04/11', '01:00:00', 'AM'],
    '7 days' => ['2010/04/05', '12:00:00', 'AM', '2010/04/12', '12:00:00', 'AM'],
    '1 week' => ['2010/04/05', '12:00:00', 'AM', '2010/04/12', '12:00:00', 'AM'],
    '1 week, 2 days' => ['2010/04/05', '12:00:00', 'AM', '2010/04/14', '12:00:00', 'AM'],
    '3 weeks' => ['2010/04/05', '12:00:00', 'AM', '2010/04/26', '12:00:00', 'AM'],
  }

  @@lotIdentifier = 'ParkingLot'
  @@startingPrefix = 'starting'
  @@leavingPrefix = 'leaving'
  @@dateTemplate = "%sDate"
  @@timeTemplate = "%sTime"
  @@amPMRadioButtonTemplate = "//input[@name='%sTimeAMPM' and @value='%s']"

  @@calculateButtunIdentifier = 'submit'
  @@costElementLocation = "//div[@id='EstimatedParkingCosts']"

  attr :page

  def initialize(page_handle)
    @page = page_handle
    @page.open '/parkcalc'
  end
  
  def select(parking_lot)
    @page.select @@lotIdentifier, parking_lot
  end
  
  def enter_parking_duration(duration)
    startingDate, startingTime, startingTimeAMPM, leavingDate, leavingTime, leavingTimeAMPM = @@durationMap[duration]
    fill_in_date_and_time_for @@startingPrefix, startingDate, startingTime, startingTimeAMPM
    fill_in_date_and_time_for @@leavingPrefix, leavingDate, leavingTime, leavingTimeAMPM
  end

  def fill_in_date_and_time_for(formPrefix, date, time, ampm)
    @page.type @@dateTemplate % formPrefix, date
    @page.type @@timeTemplate % formPrefix, time
    @page.click @@amPMRadioButtonTemplate % [formPrefix, ampm ]
  end

  def parking_costs
    calculate_parking_costs
    get_parking_costs_from_page
  end
  
  def calculate_parking_costs
    @page.click @@calculateButtunIdentifier
    @page.wait_for_page_to_load 10000
  end
  
  def get_parking_costs_from_page
    @page.get_text @@costElementLocation
  end
end
