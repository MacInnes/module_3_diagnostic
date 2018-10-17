class StationSearch

  def initialize(zip)
    @zip = zip
  end

  def stations
    @stations ||= service.station_search[:results].map do |station_data|
      Station.new(station_data)
    end
  end

  private

  def service
    StationService.new(zip: @zip)
  end
end
