require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
     it "nicknameが空だと登録できない" do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.nickname = ''  # nicknameの値を空にする
      user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.email = ''  # emailの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
     end
     it 'emailに@が含まれれば登録できる' do
     end
     it 'passwordが空では登録できない' do
      user = User.new(nickname: "ueno", email: "kkk@gmail.com", password: "", password_confirmation: "")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
     end
     it 'passwordは確認用を含めて2回入力する' do
     end
     it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
     end
     it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end
  end
end
