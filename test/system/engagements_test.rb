require "application_system_test_case"

class EngagementsTest < ApplicationSystemTestCase
  setup do
    @engagement = engagements(:one)
  end

  test "visiting the index" do
    visit engagements_url
    assert_selector "h1", text: "Engagements"
  end

  test "creating a Engagement" do
    visit engagements_url
    click_on "New Engagement"

    fill_in "Building", with: @engagement.building_id
    fill_in "Role", with: @engagement.role
    fill_in "User", with: @engagement.user_id
    click_on "Create Engagement"

    assert_text "Engagement was successfully created"
    click_on "Back"
  end

  test "updating a Engagement" do
    visit engagements_url
    click_on "Edit", match: :first

    fill_in "Building", with: @engagement.building_id
    fill_in "Role", with: @engagement.role
    fill_in "User", with: @engagement.user_id
    click_on "Update Engagement"

    assert_text "Engagement was successfully updated"
    click_on "Back"
  end

  test "destroying a Engagement" do
    visit engagements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Engagement was successfully destroyed"
  end
end
