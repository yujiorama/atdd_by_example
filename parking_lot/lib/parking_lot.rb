
class ParkCalcPage
  @@durationMap = {
    '30 minutes' => ['05/04/2010', '12:00', 'AM', '05/04/2010', '12:30', 'AM']
  }

  @@lotIdentifier = 'ParkingLot'
  @@startingPrefix = 'Starting'
  @@leavingPrefix = 'Leaving'
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
