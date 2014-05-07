
class ParkCalcPage
  attr :page


  def initialize(page_handle)
    @page = page_handle
    @page.open '/parkcalc'

    @@durationMap = {
      '30 minutes' => ['05/04/2010', '12:00', 'AM', '05/04/2010', '12:30', 'AM']
    }
  end
  
  def select(parking_lot)
    @page.select 'ParkingLot', parking_lot
  end
  
  def enter_parking_duration(duration)
    startingDate, startingTime, startingTimeAMPM, leavingDate, leavingTime, leavingTimeAMPM = @@durationMap[duration]
    @page.type 'StartingDate', startingDate
    @page.type 'StartingTime', startingTime
    @page.click "//input[@name='StartingTimeAMPM' and @value='%s']" % startingTimeAMPM

    @page.type 'LeavingDate', leavingDate
    @page.type 'LeavingTime', leavingTime
    @page.click "//input[@name='LeavingTimeAMPM' and @value='%s']" % leavingTimeAMPM
  end
  
  def parking_costs
    return nil
  end
end
