class Menu

  attr_reader :dishes

  DISHES = {
    beef: 8,
    pork: 6,
    chicken: 5,
    tofu: 3
    }
  MENU_ERROR = "That dish is not on the menu. Please select from the menu."

  def initialize
    @dishes = DISHES
  end

  def view_menu
    @dishes
  end

  def pick_dish(dish)
    raise MENU_ERROR if on_menu?(dish) == false
    @dishes[dish.to_sym]
  end

  def price(item)
    DISHES[item]
  end

  private

  def on_menu?(dish)
    @dishes.include?(dish.to_sym)
  end

end
