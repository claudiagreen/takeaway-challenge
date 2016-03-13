class Menu

  attr_reader :dishes

  DISHES = {
    beef: 8,
    pork: 6,
    chicken: 5,
    tofu: 3
    }

  def initialize
    @dishes = DISHES
  end

  def view_menu
    @dishes
  end

  def pick_dish(dish)
    @dishes[dish.to_sym]
  end

  def price(item)
    DISHES[item]
  end

end
