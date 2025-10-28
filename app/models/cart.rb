class Cart < ApplicationRecord
    has_many :cart_items
    has_many :products, through: :cart_items
    
    def total_price
        sum = 0
        cart_items.includes(:product).each do |e|
            sum += e.product.price * e.qty
        end
        sum
    end
end
