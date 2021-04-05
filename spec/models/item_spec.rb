require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe '商品出品' do
  context '商品出品に成功するとき' do
    it '商品名、商品説明、カテゴリー、商品状態、配送料の負担、発送元地域、発送までの日数、価格の表記が半角文字、価格の範囲が300円〜9,999,999円、があれば登録できる。' do
      @item.name = 'sample'
      @item.category = 'aaaaaa'
      @item.status = 'aaaaaa'
      @item.shipping_charge = 'aaaaaa'
      @item.shipping_area = 'aaaaaa'
      @item.shipping_day = '1〜1'
      @item.price = '1111111'
      expect(@item).to be_valid
    end
  end

  context '商品出品に失敗するとき' do
   it '商品名が空だと登録できない' do
     @item.name = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Nickname can't be blank")
   end
   it '商品説明が空では登録できない' do
     @item.name = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Nickname can't be blank")
   end
   it 'カテゴリーの情報がなければ登録できない' do
     @item.category = '--'
     @item.valid?
     expect(@item.errors.full_messages).to include('Email is invalid')
   end
   it '商品の状態についての情報がなければ登録できない' do
     @item.status = '--'
     @item.valid?
     expect(@item.errors.full_messages).to include('Email is invalid')
   end
   it '配送料の負担についての情報がなければ登録できない' do
     @item.shipping_charge = '--'
     @item.valid?
     expect(@item.errors.full_messages).to include('Email is invalid')
   end
   it '発送元地域についての情報がなければ登録できない' do
     @item.shipping_area = '--'
     @item.valid?
     expect(@item.errors.full_messages).to include('Email is invalid')
   end
   it '発送までの日数についての情報がなければ登録できない' do
     @item.shipping_day = '--'
     @item.valid?
     expect(@item.errors.full_messages).to include('Email is invalid')
   end

   it '価格の表記が空欄、全角文字だと登録できない' do
    @item.price = '１１１１１１'
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Password confirmation doesn't match Password")
   end
   it '価格が空欄では登録できない' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include('Email is invalid')
   end
   it '画像をアップロードしていないと登録できない' do
    @item.image = nil
    expect(@item)to. be_valid
    expect(@item.errors.full_messages).to include("Password confirmation doesn't match Password")
   end
 end
end