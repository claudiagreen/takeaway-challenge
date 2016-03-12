require 'menu'

describe Menu do

  subject(:menu){described_class.new}

  describe '#view_menu' do
    it "displays a list of dishes with prices" do
      expect(menu.view_menu).to eq menu.list_dishes
    end
  end

  describe '#order' do

  end

end
