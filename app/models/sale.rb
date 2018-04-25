class Sale < ApplicationRecord
  def self.from_file(file_content)
    sales = []
    rows = file_content.split(/\n/)
    rows.shift
    rows.each do |row|
      columns = row.split(/\t/)
      sale = new(purchaser_name: columns[0], item_description: columns[1], item_price: columns[2], purchase_count: columns[3], merchant_address: columns[4], merchant_name: columns[5])
      sales << sale
    end
    return sales
  end

  def self.total_from_sales(sales)
    total = 0
    sales.each { |sale| total += sale.item_price * sale.purchase_count }
    return total
  end
end
