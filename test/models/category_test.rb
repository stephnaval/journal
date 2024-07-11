require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "should not save category without name" do
    category = Category.new
    assert_not category.save, "Saved the category without a name"
  end

  test "should save category with a name" do
    category = Category.new(name: "Work")
    assert category.save, "Couldn't save the category with a name"
  end
end