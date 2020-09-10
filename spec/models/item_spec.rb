require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.jpg')
    end
    it '全て正しく入力されていれば登録することができること' do
      expect(@item).to be_valid
    end

    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が未選択では登録できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーが未選択では登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is reserved')
    end

    it '商品の状態が未選択では登録できないこと' do
      @item.item_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Item status is reserved')
    end

    it '配送料の負担が未選択では登録できないこと' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery fee is reserved')
    end

    it '発送元の地域が未選択では登録できないこと' do
      @item.shipping_region_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping region is reserved')
    end

    it '発送までの日数が未選択では登録できないこと' do
      @item.date_of_shipment_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Date of shipment is reserved')
    end

    it '価格が空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が300円未満では登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '価格が9999999円より大きい状態では登録できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it '販売価格は半角数字以外では登録できないこと' do
      @item.price = '１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
