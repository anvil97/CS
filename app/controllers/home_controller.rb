class HomeController < ApplicationController
  def index
    @products = Product.all
    @order_item = OrderItem.new
    @order_items = session[:cart]
    
  end
end
