require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post categories_url, params: { category: { name: 'Work' } }
    end
    assert_response :created
    json_response = JSON.parse(response.body)
    assert_equal 'Work', json_response['name']
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: { name: 'Personal' } }
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal 'Personal', json_response['name']
    @category.reload
    assert_equal 'Personal', @category.name
  end

  test "should not update category with invalid data" do
    patch category_url(@category), params: { category: { name: '' } }
    assert_response :unprocessable_entity
  end

end