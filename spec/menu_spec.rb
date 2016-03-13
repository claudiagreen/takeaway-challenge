require 'menu'

describe Menu do

  subject(:menu){described_class.new}
  let(:dish)  {double :dish,  price: 8}

  describe '#view_menu' do
    it "displays a list of dishes with prices" do
      expect(menu.view_menu).to include(described_class::DISHES)
    end
  end

  describe '#menu_price' do
    it 'can return the price of an item' do
      expect(menu.price(:beef)).to eq(8)
    end
  end

  describe '#pick_dish' do
    it 'returns the price of the dish picked' do
      expect(menu.pick_dish("beef")).to eq 8
    end
  end
end
