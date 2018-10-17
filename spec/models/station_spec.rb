require 'rails_helper'

describe Station do
  it "exists" do
    station_data = {
      station_name: "asdf",
      street_address: "123 Main St",
      fuel_type_code: "asdf",
      distance: 123,
      access_days_time: "asdf"
    }

    station = Station.new(station_data)

    expect(station).to be_a(Station)
  end

  it "has attributes" do
    station_data = {
      station_name: "asdf",
      street_address: "123 Main St",
      fuel_type_code: "asdf",
      distance: 123,
      access_days_time: "asdf"
    }
    station = Station.new(station_data)

    expect(station.name).to eq("asdf")
    expect(station.address).to eq("123 Main St")
    expect(station.fuel_types).to eq("asdf")
    expect(station.distance).to eq(123)
    expect(station.access_times).to eq("asdf")
  end
end
