class BuyPricesController < PricesController

  protected
  
  def create_price
    BuyPrice.new(params[:price])
  end

  def get_all_prices
    BuyPrice.find_all_by_product_id(params[:product])
  end

  def price_created
    prices = @price.product.buy_prices
    responds_to_parent do 
      render :update do |page|
        page.replace_html 'buy_prices', :partial => 'products/buy_prices', :object => prices
        page.call 'Windows.closeAll'
      end
    end      
  end
end
