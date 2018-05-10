class SaleService
  include Singleton

  def total_from_sales(sales)
    total = 0
    sales.each { |sale| total += sale.item_price * sale.purchase_count }
    return total
  end
end
