class CartsController < ApplicationController
  def show
    @order_items = session[:cart]
  end

  def update_cart
    params[:cart_update].each do |item|
      session[:cart][0]["item-#{item[1]['product_id']}"]["quantity"] = item[1]['quantity'].to_i
    end
    redirect_to cart_path
  end

  def nil
    session[:cart] = nil
    redirect_to root_path
  end

  def destroy_cart
    session[:cart][0].delete("item-#{params[:product_id].to_i}")
    if session[:cart][0].count == 0
      session[:cart] = nil
    end
    redirect_to root_path
  end
end
