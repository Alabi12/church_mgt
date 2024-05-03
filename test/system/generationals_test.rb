require "application_system_test_case"

class GenerationalsTest < ApplicationSystemTestCase
  setup do
    @generational = generationals(:one)
  end

  test "visiting the index" do
    visit generationals_url
    assert_selector "h1", text: "Generationals"
  end

  test "should create generational" do
    visit generationals_url
    click_on "New generational"

    fill_in "Name", with: @generational.name
    click_on "Create Generational"

    assert_text "Generational was successfully created"
    click_on "Back"
  end

  test "should update Generational" do
    visit generational_url(@generational)
    click_on "Edit this generational", match: :first

    fill_in "Name", with: @generational.name
    click_on "Update Generational"

    assert_text "Generational was successfully updated"
    click_on "Back"
  end

  test "should destroy Generational" do
    visit generational_url(@generational)
    click_on "Destroy this generational", match: :first

    assert_text "Generational was successfully destroyed"
  end
end
