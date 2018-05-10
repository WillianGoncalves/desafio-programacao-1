# frozen_string_literal: true
RSpec.describe SaleService, type: :service do
  describe 'get total from sales' do
    let!(:sale1) { build(:sale, item_price: 10, purchase_count: 2) }
    let!(:sale2) { build(:sale, item_price: 15, purchase_count: 1) }

    it { expect(SaleService.instance.total_from_sales([sale1, sale2])).to eq 35 }
    it { expect(SaleService.instance.total_from_sales([])).to eq 0 }
  end
end
