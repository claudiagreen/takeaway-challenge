require 'order'
require 'menu'

describe Order do



  subject(:order){described_class.new}
  let(:menu) {double :menu, dishes: [dish, dish2] }
  let(:dish)  {double :dish,  price: 8}
  let(:dish2) {double :dish2, price: 3}



  it{is_expected.to respond_to(:basket)}
  it{is_expected.to respond_to(:add_item).with(1).argument}

  describe "#add_item" do
    it "can select some number of several available dishes" do
      order.add_item(dish)
      expect(order.basket).to include(dish)
    end
  end

  describe "#total" do
    xit 'returns dish total' do
      order.add_item(dish, 8)
      expect(order.total).to eq 8
    end

    xit 'returns price total' do
      order.add_item(dish, 1)
      order.add_item(dish2, 1)
      expect(order.price_total).to eq 11
    end
  end

end
