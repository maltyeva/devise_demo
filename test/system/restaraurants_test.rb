require "application_system_test_case"

class RestaraurantsTest < ApplicationSystemTestCase
  setup do
    @restaraurant = restaraurants(:one)
  end

  test "visiting the index" do
    visit restaraurants_url
    assert_selector "h1", text: "Restaraurants"
  end

  test "creating a Restaraurant" do
    visit restaraurants_url
    click_on "New Restaraurant"

    fill_in "Address", with: @restaraurant.address
    fill_in "Name", with: @restaraurant.name
    fill_in "User", with: @restaraurant.user_id
    click_on "Create Restaraurant"

    assert_text "Restaraurant was successfully created"
    click_on "Back"
  end

  test "updating a Restaraurant" do
    visit restaraurants_url
    click_on "Edit", match: :first

    fill_in "Address", with: @restaraurant.address
    fill_in "Name", with: @restaraurant.name
    fill_in "User", with: @restaraurant.user_id
    click_on "Update Restaraurant"

    assert_text "Restaraurant was successfully updated"
    click_on "Back"
  end

  test "destroying a Restaraurant" do
    visit restaraurants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Restaraurant was successfully destroyed"
  end
end
