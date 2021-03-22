require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録に成功するとき' do
      it 'nickname、email、password、password_confirmationがあれば登録できる。' do
        @user.nickname = 'sample'
        @user.email = 'test@sample'
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
      it 'passwordは6文字以上で登録できる。' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end
    end

    context '新規登録に失敗するとき' do
     it 'nicknameが空だと登録できない' do
       @user.nickname = ''  # user = FactoryBot.build(:user) は５行目で@userを定義している為不要。使わない場合userには@をつける。
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it 'emailが空では登録できない' do
       @user.email = ''  # emailの値を空にする
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it 'emailに@が含まれないと登録できない' do
       @user.email = 'testtest'
       @user.valid?
       expect(@user.errors.full_messages).to include('Email is invalid')
     end
     it 'passwordが空では登録できない' do
       user = User.new(nickname: 'ueno', email: 'kkk@gmail.com', password: '', password_confirmation: '')
       user.valid?
       expect(user.errors.full_messages).to include("Password can't be blank")
     end
     it 'passwordは確認用を含めて2回入力する必要がある' do
       @user.password = '111aaa'
       @user.password_confirmation = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it 'passwordは、半角英数字混合での入力が必須であること' do
       @user.password = '111111'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it 'passwordは、半角英語のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it 'passwordは、全角では登録できない' do
      @user.password = 'ＡＡＡＡＡＡ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
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
     it 'ユーザー本名は、名前が必須であること' do
       @user.name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Name can't be blank")
     end
     it 'ユーザー本名は、名字が必須であること' do
      @user.lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank", "Lastname is invalid. Input full-width characters.")
     end
     it 'ユーザーの名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
       @user.name = 'aaa111'
       @user.valid?
       expect(@user.errors.full_messages).to include("Name is invalid. Input full-width characters.")
     end
     it 'ユーザーの名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.lastname = 'aaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname is invalid. Input full-width characters.")
    end
     it 'ユーザーの名前の振り仮名が必須であること' do
       @user.name_furigana = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Name furigana can't be blank", "Name furigana is invalid. Input full-width katakana characters.")
     end
     it 'ユーザー名字の振り仮名が必須であること' do
      @user.lastname_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname furigana can't be blank", "Lastname furigana is invalid. Input full-width katakana characters.")
    end
     it 'ユーザーの名前のフリガナは、全角（カタカナ）での入力が必須であること' do
       @user.name = 'aaa111'
       @user.valid?
       expect(@user.errors.full_messages).to include("Name is invalid. Input full-width characters.")
     end
     it 'ユーザーの名字のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.lastname = 'aaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname is invalid. Input full-width characters.")
     end
     it '生年月日が必須であること' do
       @user.birthday = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
   end
 end
end
