require 'rails_helper'

describe StationService do
  it "exists" do
    service = StationService.new("80203")

    expect(service).to be_a(StationService)
  end

  context "instance methods" do
    it "station_search works" do
      file = File.open("./fixtures/station_search.json")

      stub_request(:get, "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&limit=10").
        to_return(body: file, status: 200)

      service = StationService.new("80203")

      search = service.station_search

      expect(search).to be_a(Hash)
      expect(search[:fuel_stations]).to be_a(Array)
      expect(search[:fuel_stations].length).to eq(10)
      expect(search[:fuel_stations].first).to be_a(Hash)
      expect(search[:fuel_stations].first).to have_key(:station_name)
      expect(search[:fuel_stations].first).to have_key(:street_address)
      expect(search[:fuel_stations].first).to have_key(:fuel_type_code)
      expect(search[:fuel_stations].first).to have_key(:distance)
      expect(search[:fuel_stations].first).to have_key(:access_days_time)

    end
  end
end
