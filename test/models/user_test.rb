require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without login" do
    user = User.new(email: "test@example.com")
    assert_not user.save, "Saved the user without a login"
  end

  test "should not save user without email" do
    user = User.new(login: "MyString")
    assert_not user.save, "Saved the user without an email"
  end

  test "login should be unique" do
    user1 = users(:one)
    user2 = User.new(login: user1.login, email: "another@example.com")
    assert_not user2.save, "Saved the user with a duplicate login"
  end

  test "email should be unique" do
    user1 = users(:one)
    user2 = User.new(login: "AnotherString", email: user1.email)
    assert_not user2.save, "Saved the user with a duplicate email"
  end
end

