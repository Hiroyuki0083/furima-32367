class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def create
    @items = Item.new(items_params)
    # モデル名を指定しているので複数形にはしない
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def items_params
    params.require(:item).permit(:title, :item)
  end
end
