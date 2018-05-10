class Sale < ApplicationRecord
  validates :purchaser_name, :item_description, :merchant_address, :merchant_name, presence: true
  validates :item_price, presence: true, numericality: { greater_than: 0 }
  validates :purchase_count, presence: true, numericality: { greater_than: 0 }
end
