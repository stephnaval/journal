require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
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

  test "should create category" do
    assert_difference('Category.count') do
      post categories_url, params: { category: { name: 'Work' } }
    end
    assert_response :created
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should edit category" do
    get edit_category_url(@category)
    assert_response :success
  end
end