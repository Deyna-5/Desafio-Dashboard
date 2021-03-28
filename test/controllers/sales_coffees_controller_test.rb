require 'test_helper'

class SalesCoffeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_coffee = sales_coffees(:one)
  end

  test "should get index" do
    get sales_coffees_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_coffee_url
    assert_response :success
  end

  test "should create sales_coffee" do
    assert_difference('SalesCoffee.count') do
      post sales_coffees_url, params: { sales_coffee: { blend_name: @sales_coffee.blend_name, origin: @sales_coffee.origin, price: @sales_coffee.price } }
    end

    assert_redirected_to sales_coffee_url(SalesCoffee.last)
  end

  test "should show sales_coffee" do
    get sales_coffee_url(@sales_coffee)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_coffee_url(@sales_coffee)
    assert_response :success
  end

  test "should update sales_coffee" do
    patch sales_coffee_url(@sales_coffee), params: { sales_coffee: { blend_name: @sales_coffee.blend_name, origin: @sales_coffee.origin, price: @sales_coffee.price } }
    assert_redirected_to sales_coffee_url(@sales_coffee)
  end

  test "should destroy sales_coffee" do
    assert_difference('SalesCoffee.count', -1) do
      delete sales_coffee_url(@sales_coffee)
    end

    assert_redirected_to sales_coffees_url
  end
end
