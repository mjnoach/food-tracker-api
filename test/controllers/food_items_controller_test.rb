require 'test_helper'

class FoodItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get food_items_index_url
    assert_response :success
  end

  test "should get create" do
    get food_items_create_url
    assert_response :success
  end

  test "should get destroy" do
    get food_items_destroy_url
    assert_response :success
  end

end
