require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)  # Assuming you have a fixture file for categories
  end

  test "should update category" do
    patch category_url(@category), params: { category: { name: 'Personal' } }
    assert_response :success
    @category.reload
    assert_equal 'Personal', @category.name
  end

  test "should not update category with invalid data" do
    patch category_url(@category), params: { category: { name: '' } }
    assert_response :unprocessable_entity
  end
end