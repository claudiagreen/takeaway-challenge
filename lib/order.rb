require_relative 'menu'

class Order

  attr_reader :basket, :amount

  def initialize
    @basket = []
    @quant = []
  end

  def add_item(dish, quantity=1)
    @basket << dish
    @quant << quantity
  end

  def price_total
    total = 0
    basket.each_with_index do |item, index|
      total += (item.price * quant[index])
    end
    total
  end



end
