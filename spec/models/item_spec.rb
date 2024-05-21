require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報登録' do
    context 'アイテム保存できるとき' do
      it 'すべてのフィールドが正しく設定されている場合、アイテムは保存される' do
        expect(@item).to be_valid
      end
    end
    context 'アイテム保存できないとき' do
      it '画像がない場合、アイテムは保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がない場合、アイテムは保存できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の紹介がない場合、アイテムは保存できない。' do
        @item.product_introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product introduction can't be blank")
      end
      it 'カテゴリーIDがない場合、アイテムは保存できない。' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態IDがない場合、アイテムは保存できない' do
        @item.product_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it '配送料の負担IDがない場合、アイテムは保存できない。' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it '発送元の地域IDがない場合、アイテムは保存できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数IDがない場合、アイテムは保存できない' do
        @item.days_until_shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days until shipping can't be blank")
      end
      it '価格がない場合、アイテムは保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が整数でない場合、アイテムは保存できない。' do
        @item.price = 300.5
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end
      it '価格が300以下の場合、アイテムは保存できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が9999999以上の場合、アイテムは保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'カテゴリーIDが1の場合、アイテムは保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態IDが1の場合、アイテムは保存できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it '配送料の負担IDが1の場合、アイテムは保存できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it '発送元の地域IDが1の場合、アイテムは保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数IDが1の場合、アイテムは保存できない' do
        @item.days_until_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days until shipping can't be blank")
      end
      it 'userが紐づいていない場合は登録できない' do
        @item = build(:item, user: nil)
        @item.valid?
        expect(@item.errors[:user]).to include('must exist')
      end
      it '価格が半角数値以外（全角を含む場合）保存できない' do
        @item = build(:item, price: '一二三')
        @item.valid?
        expect(@item.errors[:price]).to include('is not a number')
      end
    end
  end
end
