require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '購入機能' do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_purchase).to be_valid
    end
    it 'tokenが空だと保存できないこと' do
      @user_purchase.token = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @user_purchase.postal_code = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがないと保存できないこと' do
      @user_purchase.postal_code = '1234567'
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include('Postal code is invalid')
    end

    it 'prefecture_idが未選択だと保存できないこと' do
      @user_purchase.prefecture_id = 1
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include('Prefecture is reserved')
    end
    it 'cityが空だと保存できないこと' do
      @user_purchase.city = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @user_purchase.address = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @user_purchase.phone_number = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberはハイフンがあると保存できないこと' do
      @user_purchase.phone_number = '05-234-5678'
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
