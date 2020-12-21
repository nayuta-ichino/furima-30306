require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録ができない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'メールアドレスが空だと登録ができない' do
      @user.email = ''
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'パスワードが空だと登録ができない' do
      @user.password = ''
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it '確認用パスワードが一致しないと登録ができない' do
      @user.password_confirmation = ''
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it '苗字が空だと登録ができない' do
      @user.last_name = ''
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include "Last name can't be blank", 'Last name is invalid'
    end
    it '名前が空だと登録ができない' do
      @user.first_name = ''
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include "First name can't be blank", 'First name is invalid'
    end
    it '苗字カナが空だと登録ができない' do
      @user.last_name_kana = ''
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include 'Last name kana is invalid'
    end
    it '名前カナが空だと登録ができない' do
      @user.first_name_kana = ''
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include "First name kana can't be blank", 'First name kana is invalid'
    end
    it '誕生日が空だと登録ができない' do
      @user.birthday = ''
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
