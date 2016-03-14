require 'order'
require 'menu'
require 'text'

describe Order do

  let(:text_class){double:text_class, new: message}
  let(:message){double:message, send_message: nil}
  let(:menu) {{beef: 8, chicken: 5}}
  subject(:order){described_class.new(menu, message)}
  let(:dish3) {double :dish3, pick_dish: 8}
  let(:beef_dish) { [:beef, 8] }

  describe "#add_item" do
    it "can select a dish from several available dishes(dish)" do
      allow(menu).to receive(:pick_dish).and_return(:beef_dish)
      order.add_item(:beef)
      expect(order.basket[0]).to include(:beef)
    end
    it "can select a dish from several available dishes(price)" do
      allow(menu).to receive(:pick_dish).and_return(8)
      order.add_item(:beef)
      expect(order.basket[0][1]).to eq 8
    end
    it "can select a dish from several available dishes(quantity)" do
      allow(menu).to receive(:pick_dish)
      order.add_item(:beef)
      expect(order.basket[0][2]).to eq 1
    end
  end

  describe "#basket_total" do
    it "returns the total price of the order in basket" do
      allow(menu).to receive(:pick_dish).and_return(8)
      order.add_item(dish3)
      expect(order.basket_total).to eq dish3.pick_dish
    end
  end

  describe "#return_total" do
    it "returns the correct total" do
      allow(menu).to receive(:pick_dish).and_return(8)
      order.add_item(:beef)
      expect(order.confirm_total).to eq "Your total amount to pay is: £#{order.basket_total}.00"
    end
  end

  describe "#complete" do
    it "can complete order when ready" do
      allow(menu).to receive(:pick_dish).and_return(8)
      order.add_item(:beef)
      expect(message).to receive(:send_message)
      order.complete
    end
    it "raises an error when trying to compelte on empty order" do
      expect{order.complete}.to raise_error described_class::COMPLETE_ERROR
    end
  end

end
