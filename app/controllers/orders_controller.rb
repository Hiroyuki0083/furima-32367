class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]

  def index
    @form = Form.new
    @item = Item.find(params[:item_id])
  end

  def create
    @form = Form.new(order_params)
    @item = Item.find(params[:item_id])
    if @form.valid?
      pay_item
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,            # 商品の値段
      card: order_params[:token],     # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.buy_management == nil
      redirect_to root_path
    end
    # unless user_signed_in?
    #   redirect_to root_path
    # end
  end

end