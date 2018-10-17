require 'rails_helper'

describe StationSearch do
  before :each do
    file = File.open("./fixtures/station_search.json")

    stub_request(:get, "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&limit=10").
      to_return(body: file, status: 200)
  end

  it "exists" do
    stations_search = StationSearch.new("80203")
    expect(stations_search).to be_a(StationSearch)
  end

  context "instance methods" do
    it "stations method works" do
      stations_search = StationSearch.new("80203")
      stations = stations_search.stations

      expect(stations.length).to eq(10)
      expect(stations.first).to be_a(Station)
    end
  end
end
