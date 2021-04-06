require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
    # pending "add some examples to (or delete) #{__FILE__}"
  end

 describe '商品出品' do

    context '商品出品に成功するとき' do
        it '必要な情報を適切に入力すれば登録できる。' do
          @item.name = 'sample'
          @item.category_id = 'aaaaaa'
          @item.status_id = 'aaaaaa'
          @item.shipping_charge_id = 'aaaaaa'
          @item.shipping_area_id = 'aaaaaa'
          @item.shipping_day_id = '1〜1'
          @item.price = '1111111'
          expect(@item).to be_valid
        end
    end

    context '商品出品に失敗するとき' do

      it '商品名が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end
      it '商品説明が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end
      it 'カテゴリーの情報がなければ登録できない' do
        @item.category_id = '--'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態についての情報がなければ登録できない' do
        @item.status_id = '--'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担についての情報がなければ登録できない' do
        @item.shipping_charge_id = '--'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it '発送元地域についての情報がなければ登録できない' do
        @item.shipping_area_id = '--'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '発送までの日数についての情報がなければ登録できない' do
        @item.shipping_day_id = '--'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '価格の表記が全角文字だと登録できない' do
        @item.price = '１１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格が空欄では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '画像をアップロードしていないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end