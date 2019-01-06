require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique with case sensitive" do
    @category.save

    category2 = Category.create(name: "Sports")

    assert_not category2.valid?
  end

  test "name should not be too short" do
    @category.name = "a" * 2
    assert_not @category.valid?
  end

  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "should respond_to articles" do
    assert @category.respond_to?('articles')
  end

end