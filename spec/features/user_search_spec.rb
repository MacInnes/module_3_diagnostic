require 'rails_helper'

feature 'Search' do
  scenario 'user searches by zip' do
    file = File.open("./fixtures/station_search.json")

    stub_request(:get, "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&limit=10").
      to_return(body: file, status: 200)
    # As a user
    # When I visit "/"
    visit '/'
    # And I fill in the search form with 80203 (Note: Use the existing search form)
    fill_in "q", with: "80203"
    # And I click "Locate"
    click_on "Locate"
    # Then I should be on page "/search"
    expect(current_path).to eq("/search")
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_css(".station", count: 10)
    # And the stations should be limited to Electric and Propane
    #TODO: test this
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    first(".station") do
      expect(page).to have_css(".name")
      expect(page).to have_css(".address")
      expect(page).to have_css(".fuel_types")
      expect(page).to have_css(".access_times")
    end
  end
end
