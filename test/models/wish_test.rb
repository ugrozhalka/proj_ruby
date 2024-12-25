require "test_helper"

class WishTest < ActiveSupport::TestCase
  setup do
    @wish = Wish.new(title: "My Wish", description: "This is a description.")
  end

  test "should not be valid without a description" do
    @wish.description = nil
    assert_not @wish.valid?
  end

  test "title should not be too short" do
    @wish.title = "a" * 2 # Предполагаем, что минимальная длина заголовка - 3 символа
    assert_not @wish.valid?
  end

  test "description should not be too short" do
    @wish.description = "a" * 4 # Предполагаем, что минимальная длина описания - 5 символов
    assert_not @wish.valid?
  end

  test "title should not be too long" do
    @wish.title = "a" * 256 # Предполагаем, что максимальная длина заголовка - 255 символов
    assert_not @wish.valid?
  end

  test "description should not be too long" do
    @wish.description = "a" * 1001 # Предполагаем, что максимальная длина описания - 1000 символов
    assert_not @wish.valid?
  end

end

