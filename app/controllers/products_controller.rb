class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  # before_action :search_product, only: [:index, :search]

  def index
    # @products = Product.all  # 全商品の情報を取得
    # @p = Product.ransack(params[:q])
    # set_product_column       # privateメソッド内で定義
  end

  # def search
  #   @results = @p.result.includes(:search_category)  # 検索条件にマッチした商品の情報を取得
  # end
  # def search
  #   @products = Product.search(params[:keyword])
  # end

  private

  # def search_product
  #   @p = Product.ransack(params[:q])  # 検索オブジェクトを生成
  # end

  # def set_product_column
  #   @product_name = Product.select("name").distinct  # 重複なくnameカラムのデータを取り出す
  # end
  
end


# 不要なコントローラー、テーブルであるため削除予定