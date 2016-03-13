require_relative 'menu'
require_relative 'text'

class Order

  attr_reader :basket, :amount
  COMPLETE_ERROR = "You need to add to basket before completing order."

  def initialize(menu = Menu.new, message = Text)
    @menu = menu
    @basket = []
    @message = message
  end

  def add_item(dish, quantity=1)
    @basket << [dish, @menu.pick_dish(dish), quantity]
  end

  def confirm_total
    "Your total amount to pay is: £#{'%.2f' % basket_total}"
  end

  def complete
    raise COMPLETE_ERROR if basket.empty?
    @message.send_message
  end

  def basket_total
    total = 0
    @basket.each do |item, price, quantity|
      total += price * quantity
    end
    total
  end

end
