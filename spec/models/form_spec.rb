require 'rails_helper'

RSpec.describe Form, type: :model do

  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item) #テーブルに存在するデータを持ってくるのでcreate
    @order = FactoryBot.build(:form, user_id: @user.id, item_id: @item.id)
    sleep 0.1 # 処理が早すぎると以降のテストでサーバーエラーが出ることがある
  end
  
  describe '商品購入' do

    context '商品購入に成功するとき' do
      it '必要な項目を適切に記入すれば購入できる。' do
        @order.post_number = '111-1111'
        @order.shipping_area_id = 2
        @order.municipality = 'サンプル'
        @order.address = 'サンプル111'
        @order.telephone_number = '11111111111'
        expect(@order).to be_valid
      end
    end

    context '商品購入に失敗するとき' do
     it '郵便番号がないと購入できない' do
       @order.post_number = ''  # user = FactoryBot.build(:user) は５行目で@userを定義している為不要。使わない場合userには@をつける。
       @order.valid?
       expect(@order.errors.full_messages).to include("Post number is invalid")
     end
     it '郵便番号にハイフンがないと購入できない' do
       @order.post_number = '1111111'  # user = FactoryBot.build(:user) は５行目で@userを定義している為不要。使わない場合userには@をつける。
       @order.valid?
       expect(@order.errors.full_messages).to include("Post number is invalid")
     end
     it '郵便番号に半角数字以外が含まれていると購入できない' do
       @order.telephone_number = 'あああ' 
       @order.telephone_number = 'aaa' 
       @order.telephone_number = 'ＡＡＡ' 
       @order.telephone_number = '１１１' 
       @order.valid?
       expect(@order.errors.full_messages).to include("Telephone number is not a number")
     end
     it '都道府県が選択されていないと購入できない' do
       @order.shipping_area_id = 1  
       @order.valid?
       expect(@order.errors.full_messages).to include("Shipping area must be other than 1")
     end
     it '市区町村が記入されていないと購入できない' do
       @order.municipality = '' 
       @order.valid?
       expect(@order.errors.full_messages).to include("Municipality can't be blank")
     end
     it '番地が記入されていないと購入できない' do
       @order.address = ''
       @order.valid?
       expect(@order.errors.full_messages).to include("Address can't be blank")
     end
     it '電話番号が記入されていないと購入できない' do
       @order.telephone_number = '' 
       @order.valid?
       expect(@order.errors.full_messages).to include("Telephone number is not a number")
     end
     it '電話番号にハイフンが含まれていると購入できない' do
       @order.telephone_number = '-' 
       @order.valid?
       expect(@order.errors.full_messages).to include("Telephone number is not a number")
     end
     it '電話番号に半角数字以外が含まれていると購入できない' do
       @order.telephone_number = 'あああ' 
       @order.telephone_number = 'aaa' 
       @order.telephone_number = 'ＡＡＡ' 
       @order.telephone_number = '１１１' 
       @order.valid?
       expect(@order.errors.full_messages).to include("Telephone number is not a number")
     end
  end
end
end