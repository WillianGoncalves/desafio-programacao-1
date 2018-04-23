module SalesHelper
  def total_from(sales)
    total = 0
    sales.each { |sale| total += sale.item_price * sale.purchase_count }
    return total
  end
end
