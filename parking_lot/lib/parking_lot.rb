
class ParkCalcPage
  attr :page

  def initialize(page_handle)
    @page = page_handle
    @page.get '/parkcalc'
  end
end
