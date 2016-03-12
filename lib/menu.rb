

class Menu

  attr_reader :list_dishes

  def view_menu
    @list_dishes = {beef: 8, pork: 6, chicken: 5, tofu: 3}
  end

end
