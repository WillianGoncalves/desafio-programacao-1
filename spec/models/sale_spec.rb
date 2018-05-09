require 'rails_helper'

RSpec.describe Sale, type: :model do

  it { is_expected.to validate_presence_of :purchaser_name }
  it { is_expected.to validate_presence_of :item_description }
  it { is_expected.to validate_presence_of :item_price }
  it { is_expected.to validate_numericality_of(:item_price).is_greater_than(0) }
  it { is_expected.to validate_presence_of :purchase_count }
  it { is_expected.to validate_numericality_of(:purchase_count).is_greater_than(0) }
  it { is_expected.to validate_presence_of :merchant_address }
  it { is_expected.to validate_presence_of :merchant_name }

  describe 'get sales from file' do
    before(:all) do
      file = fixture_file_upload('files/example_input.tab', 'application/octet-stream')
      @content = file.read.force_encoding('UTF-8')
    end

    it { expect(Sale.from_file(@content)).to be_an Array }
    it { expect(Sale.from_file(@content).length).to eq 4 }
    it { expect(Sale.from_file(@content)).to all(be_a(Sale)) }
  end

  describe 'get total from sales' do
    let!(:sale1) { build(:sale, item_price: 10, purchase_count: 2) }
    let!(:sale2) { build(:sale, item_price: 15, purchase_count: 1) }

    it { expect(Sale.total_from_sales([sale1, sale2])).to eq 35 }
    it { expect(Sale.total_from_sales([])).to eq 0 }
  end
end
