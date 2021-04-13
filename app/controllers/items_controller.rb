class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  # def update
  #   if current_user.update(user_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end
  # 商品編集機能の記述

  def create
    @item = Item.new(items_params)
    # モデル名を指定しているので複数形にはしない
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    
  end

  private
  
  def items_params
    params.require(:item).permit(:name, :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, :price, :image, :information).merge(user_id: current_user.id)
  end
end
