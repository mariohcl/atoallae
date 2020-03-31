class StocksController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @stock = Stock.new
  end

  def create

    @product = Product.find(params[:product_id])

    params[:stock][:stock].to_i.times do
      Stock.create(product_id: @product.id, price: params[:stock][:price])
    end

    # redirect_to product_stocks_path(@product)

  end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_stock
        @stock = Stock.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def stock_params
        params.require(:product).permit(:price)
      end

end
