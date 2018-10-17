class StationSearch

  def initialize(zip)
    @zip = zip
  end

  def stations
    @stations ||= service.station_search[:fuel_stations].map do |station_data|
      Station.new(station_data)
    end
  end

  private

  def service
    StationService.new(@zip)
  end
end
