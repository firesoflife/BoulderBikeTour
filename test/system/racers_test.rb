require "application_system_test_case"

class RacersTest < ApplicationSystemTestCase
  setup do
    @racer = racers(:one)
  end

  test "visiting the index" do
    visit racers_url
    assert_selector "h1", text: "Racers"
  end

  test "creating a Racer" do
    visit racers_url
    click_on "New Racer"

    fill_in "City", with: @racer.city
    fill_in "F name", with: @racer.f_name
    fill_in "L name", with: @racer.l_name
    fill_in "Lat", with: @racer.lat
    fill_in "Lng", with: @racer.lng
    fill_in "State", with: @racer.state
    click_on "Create Racer"

    assert_text "Racer was successfully created"
    click_on "Back"
  end

  test "updating a Racer" do
    visit racers_url
    click_on "Edit", match: :first

    fill_in "City", with: @racer.city
    fill_in "F name", with: @racer.f_name
    fill_in "L name", with: @racer.l_name
    fill_in "Lat", with: @racer.lat
    fill_in "Lng", with: @racer.lng
    fill_in "State", with: @racer.state
    click_on "Update Racer"

    assert_text "Racer was successfully updated"
    click_on "Back"
  end

  test "destroying a Racer" do
    visit racers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Racer was successfully destroyed"
  end
end
