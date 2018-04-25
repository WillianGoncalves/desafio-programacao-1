class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def new; end

  def create
    file = params[:file]
    return render :new if file.blank?

    content = file.read.force_encoding('UTF-8')
    sales = Sale.from_file(content)
    
    Sale.transaction do
      sales.each { |sale| sale.save }
    end

    redirect_to sales_path
  end
end
