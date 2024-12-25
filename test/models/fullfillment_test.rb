require 'test_helper'

class FulfillmentTest < ActiveSupport::TestCase
  def setup
    @creator = User.create(email: 'creator@example.com', password: 'password')
    @performer = User.create(email: 'performer@example.com', password: 'password')
    @wish = Wish.create(title: 'Sample Wish', description: 'This is a sample wish.')
    @fulfillment = Fulfillment.new(creator: @creator, performer: @performer, wish: @wish)
  end

  test "should be valid" do
    assert @fulfillment.valid?
  end

  test "should require a creator" do
    @fulfillment.creator = nil
    assert_not @fulfillment.valid?
  end

  test "should require a performer" do
    @fulfillment.performer = nil
    assert_not @fulfillment.valid?
  end

  test "should require a wish" do
    @fulfillment.wish = nil
    assert_not @fulfillment.valid?
  end

  test "should belong to creator" do
    assert_equal @creator, @fulfillment.creator
  end

  test "should belong to performer" do
    assert_equal @performer, @fulfillment.performer
  end

  test "should belong to wish" do
    assert_equal @wish, @fulfillment.wish
  end
end

