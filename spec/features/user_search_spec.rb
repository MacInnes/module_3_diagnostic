require 'rails_helper'

feature 'Search' do
  scenario 'user searches by zip' do
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
    within(".station").first do
      expect(page).to have_css(".name")
      expect(page).to have_css(".address")
      expect(page).to have_css(".fuel_types")
      expect(page).to have_css(".access_times")
    end
  end
end
