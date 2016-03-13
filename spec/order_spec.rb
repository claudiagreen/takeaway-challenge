require 'order'
require 'menu'

describe Order do

  subject(:order){described_class.new}
  let(:menu) {double :menu, dishes: Menu::DISHES}
  # let(:dish1)  {double "dish1"}
  # let(:dish2) {double "dish2"}
  # allow(pick_dish).to receive(:dish3).and_return(8)
  let(:dish3) {double :dish3, pick_dish: 8}



  it{is_expected.to respond_to(:basket)}
  it{is_expected.to respond_to(:add_item).with(1).argument}

  describe "#add_item" do
    it "can select a dish from several available dishes(dish)" do
      order.add_item("beef")
      expect(order.basket[0]).to include("beef")
    end
    it "can select a dish from several available dishes(price)" do
      allow(menu).to receive(:pick_dish).and_return(8)
      order.add_item("beef")
      expect(order.basket[0][1]).to eq 8
    end
    it "can select a dish from several available dishes(quantity)" do
      allow(menu).to receive(:pick_dish)
      order.add_item("beef")
      expect(order.basket[0][2]).to eq 1
    end
  end

  describe "#basket_total" do
    it "returns the total price of the order in basket" do
      order.add_item(dish3)
      p order
      expect(order.basket_total).to eq total
    end
  end

end
