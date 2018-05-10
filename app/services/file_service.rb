class FileService
  include Singleton

  def extract_sales(file)
    raise StandardError if file.blank?
    file_content = file.read.force_encoding('UTF-8')
    sales = []
    rows = file_content.split(/\n/)
    rows.shift
    rows.each do |row|
      columns = row.split(/\t/)
      sales << Sale.new(purchaser_name: columns[0], item_description: columns[1], item_price: columns[2], purchase_count: columns[3], merchant_address: columns[4], merchant_name: columns[5])
    end
    return sales
  end
end
