require_relative 'menu'

class Order

  attr_reader :basket, :amount

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @total = 0
  end

  def add_item(dish, quantity=1)
    @basket << [dish, @menu.pick_dish(dish), quantity]
  end

  def basket_total
    @basket.each do |item, price, quantity|
      @total += price * quantity
    end
    @total
  end

end
