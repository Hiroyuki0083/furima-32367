class OrdersController < ApplicationController

  def index
    @form = Form.new
    @item = Item.find(params[:item_id])
  end

  def create
    @form = Form.new(order_params)
    @item = Item.find(params[:item_id])
    if @form.valid?

      @form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:form).permit(:post_number, :shipping_area_id, :municipality, :address,:building_name, :telephone_number, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    # item_idはrequireで指定したフォームのハッシュの外にあるので、マージに記述しなければならない
  end

end