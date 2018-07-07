class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.all
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
  end

  # GET /order_items/new
  def new
    @order_item = OrderItem.new
  end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items
  # POST /order_items.json
  def create
    debugger
    if session[:cart].nil?
      session[:cart] = 
      [
        {
          "item-#{params[:order_item][:product_id]}" => {
            quantity: params[:order_item][:quantity].to_i,
            product_id: params[:order_item][:product_id].to_i
          }
        }
      ]
    elsif session[:cart][0]["item-#{params[:order_item][:product_id]}"] != nil
      session[:cart][0]["item-#{params[:order_item][:product_id]}"]["quantity"] += params[:order_item][:quantity].to_i

    else
      
      session[:cart][0].update(
        "item-#{params[:order_item][:product_id]}" => {
          quantity: params[:order_item][:quantity].to_i,
          product_id: params[:order_item][:product_id].to_i
        }
        )
      
    end
    redirect_to root_path
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to @order_item, notice: 'Order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_items_url, notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:product_id, :order_id, :price, :quantity)
    end
end
