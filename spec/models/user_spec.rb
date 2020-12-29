require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'ニックネーム、メールアドレス、パスワード、確認用パスワード、苗字、名前、苗字カナ、名前カナ、生年月日が入力されていれば登録が可能' do
        expect(@user).to be_valid
      end
      it 'パスワードが半角英数字混合だと登録が可能' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
      it '苗字と名前が全角（漢字・ひらがな・カタカナ）であれば登録が可能' do
        @user.first_name = 'あ漢ア'
        @user.last_name = 'あ漢ア'
        expect(@user).to be_valid
      end
      it '苗字カナと名前カナが全角（カタカナ）であれば登録が可能' do
        @user.first_name_kana = 'ア'
        @user.last_name_kana = 'ア'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録ができない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'メールアドレスが空だと登録ができない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it '@が含まれない場合には登録ができない' do
        @user.email = 'test.test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'パスワードが空だと登録ができない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'パスワードが数字だけだと登録ができない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password", 'Password is invalid'
      end
      it 'パスワードが英字だけだと登録ができない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password", 'Password is invalid'
      end
      it 'パスワードに全角が含まれると登録ができない' do
        @user.password = 'Ａ11111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password", 'Password is invalid'
      end
      it 'パスワードが5文字以下だと登録ができない' do
        @user.password = '11aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password", 'Password is too short (minimum is 6 characters)'
      end
      it '確認用パスワードが一致しないと登録ができない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '苗字が空だと登録ができない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank", 'Last name is invalid'
      end
      it '名前が空だと登録ができない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank", 'First name is invalid'
      end
      it '苗字は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'nayuta'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
      it '名前は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'nayuta'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end
      it '苗字カナが空だと登録ができない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end
      it '名前カナが空だと登録ができない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank", 'First name kana is invalid'
      end
      it '苗字は全角（カタカナ）での入力が必須であること' do
        @user.last_name_kana = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end
      it '名前は全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end
      it '誕生日が空だと登録ができない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
