class OrdersController < ApplicationController

  def index
    @form = Form.new
    # @item = Item.new
  end

  def create
    Order.create(order_params)
  end

  private

  def order_params
    params.permit(:order)
  end

end
