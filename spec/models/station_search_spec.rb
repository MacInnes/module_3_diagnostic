require 'rails_helper'

describe StationSearch do
  before :each do
    file = File.open("./fixtures/station_search.json")

    stub_request(:get, "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&limit=10").
      to_return(body: file, status: 200)
  end

  it "exists" do
    response_stations = StationSearch.new("80203")
    expect(response_stations).to be_a(StationSearch)
  end
end
