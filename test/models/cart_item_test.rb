require "test_helper"

class CartItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test '自然数以外の入力を制限' do
    cart_item = CartItem.new(qty: 1, product_id: nil, cart_id: nil)
    assert_not cart_item.save
  end
end
