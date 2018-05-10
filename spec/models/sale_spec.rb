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
end
