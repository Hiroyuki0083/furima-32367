class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # ここでShowを書かないとトップページから詳細ページに行くとログインを求められる。
  before_action :set_item, only: [:show, :edit, :update, :move_to_index, :destroy]
  before_action :move_to_index, only: [:destroy, :update, :edit]
  before_action :search_product, only: [:index, :search]

  def index
    @items = Item.all.order("created_at DESC")
    @items = Item.all  # 全商品の情報を取得
    @p = Item.ransack(params[:q])
    set_product_column       # privateメソッド内で定義
  end

  def new
    @item = Item.new
  end

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
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def edit
  end

  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
  
  def items_params
    params.require(:item).permit(:name, :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, :price, :image, :information).merge(user_id: current_user.id)
  end

  def move_to_index
    if @item.user_id != current_user.id || @item.buy_management != nil
      redirect_to root_path
    end
  end

  def search_product
    @p = Item.ransack(params[:q])  # 検索オブジェクトを生成
  end

  def set_product_column
    @item_name = Item.select("name").distinct  # 重複なくnameカラムのデータを取り出す
  end
  
end 