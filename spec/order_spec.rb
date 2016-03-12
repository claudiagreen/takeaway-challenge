require 'order'

describe Order do

  subject(:order){described_class.new}

  it{is_expected.to respond_to(:basket)}
  it{is_expected.to respond_to(:add_item).with(1).argument}

  describe "#add_item" do
    it "can select some number of several available dishes" do
      order.add_item(:beef, 1)
      expect(order.basket).to include(:beef, 1)
    end
  end

end
