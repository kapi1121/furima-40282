require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: @item.id)
  end
  describe '購入機能の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_shipping).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_shipping.building_name = ''
        expect(@purchase_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase_shipping.post_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_shipping.post_code = '1234567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_shipping.prefecture_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @purchase_shipping.municipality = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'street_addressが空だと保存できないこと' do
        @purchase_shipping.street_address = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_shipping.phone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは10桁以上11桁以内の半角数値のみ出ないと保存できないこと' do
        @purchase_shipping.phone_number = '090-1234-5678' 
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number ハイフン無し10桁以上11桁以内の半角数値で入力してください")
      end
      it 'phone_numberが9桁以下だと保存できない' do
        @purchase_shipping.phone_number = '123456789'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number ハイフン無し10桁以上11桁以内の半角数値で入力してください")
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @purchase_shipping.phone_number = '123456789012'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number ハイフン無し10桁以上11桁以内の半角数値で入力してください")
      end
      it 'tokenが空では登録できないこと' do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
