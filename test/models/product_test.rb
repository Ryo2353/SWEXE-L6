require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  require "test_helper"
  
  test "有効なデータは保存できる" do
    product = Product.new(name: "テスト商品", price: 500)
    assert product.valid?
  end

  test "nameが空だと無効" do
    product = Product.new(name: "", price: 500)
    assert_not product.valid?
  end

  test "nameが重複すると無効" do
    Product.create!(name: "商品A", price: 100)
    duplicate = Product.new(name: "商品A", price: 200)
    assert_not duplicate.valid?
  end

  test "nameが51文字以上だと無効" do
    product = Product.new(name: "あ" * 51, price: 500)
    assert_not product.valid?
  end

  test "priceが空だと無効" do
    product = Product.new(name: "商品B", price: nil)
    assert_not product.valid?
  end

  test "priceが整数でないと無効" do
    product = Product.new(name: "商品C", price: 100.5)
    assert_not product.valid?
  end

  test "priceが1以下だと無効" do
    product = Product.new(name: "商品D", price: 1)
    assert_not product.valid?
  end

  test "priceが1000000を超えると無効" do
    product = Product.new(name: "商品E", price: 1_000_001)
    assert_not product.valid?
  end

end
