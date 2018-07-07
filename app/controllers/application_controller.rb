class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  before_action :total_quantity
  before_action :total_money
  
  def total_quantity
    total = 0
    if session[:cart].nil?
      session[:total_quantity] = 0
    else
      session[:cart][0].each do |item|
         total += item[1]['quantity']
      end
    end
    session[:total_quantity] = total
  end

  def total_money
    total = 0
    if session[:cart].nil?
      session[:total_money]= 0
    else
      session[:cart][0].each do |item|
         total += Product.find(item[1]["product_id"]).price*item[1]["quantity"]
      end
    end
    session[:total_money] = total
  end
end
