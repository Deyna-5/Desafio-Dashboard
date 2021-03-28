require "application_system_test_case"

class SalesCoffeesTest < ApplicationSystemTestCase
  setup do
    @sales_coffee = sales_coffees(:one)
  end

  test "visiting the index" do
    visit sales_coffees_url
    assert_selector "h1", text: "Sales Coffees"
  end

  test "creating a Sales coffee" do
    visit sales_coffees_url
    click_on "New Sales Coffee"

    fill_in "Blend name", with: @sales_coffee.blend_name
    fill_in "Origin", with: @sales_coffee.origin
    fill_in "Price", with: @sales_coffee.price
    click_on "Create Sales coffee"

    assert_text "Sales coffee was successfully created"
    click_on "Back"
  end

  test "updating a Sales coffee" do
    visit sales_coffees_url
    click_on "Edit", match: :first

    fill_in "Blend name", with: @sales_coffee.blend_name
    fill_in "Origin", with: @sales_coffee.origin
    fill_in "Price", with: @sales_coffee.price
    click_on "Update Sales coffee"

    assert_text "Sales coffee was successfully updated"
    click_on "Back"
  end

  test "destroying a Sales coffee" do
    visit sales_coffees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sales coffee was successfully destroyed"
  end
end
