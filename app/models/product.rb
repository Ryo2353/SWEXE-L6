class Product < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    has_many :carts, through: :cart_items
    
    validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
    validates :price, presence: true, numericality: { only_integer: true, greater_than: 1, less_than_or_equal_to: 1_000_000 }
end
