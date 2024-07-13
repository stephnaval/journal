require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "should not save category without name" do
    category = Category.new
    assert_not category.save, "Saved the category without a name"
  end

  test "fixture category one" do
    category = categories(:one)
    assert_equal 'MyString', category.name
  end

  test "fixture category two" do
    category = categories(:two)
    assert_equal 'MyString', category.name
  end
end