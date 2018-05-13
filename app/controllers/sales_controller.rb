class SalesController < ApplicationController
  def index
    @sales = Sale.all
    @total = SaleService.instance.total_from_sales(@sales)
  end

  def new; end

  def create
    begin
      sales = FileService.instance.extract_sales(params[:file])
      Sale.transaction do
        sales.each { |sale| sale.save! }
      end
      redirect_to sales_path
    rescue
      render :new
    end
  end
end
