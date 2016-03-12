require_relative 'menu'

class Order

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_item(dish, quantity=1)
    @basket << dish
    @basket << quantity
  end


end
