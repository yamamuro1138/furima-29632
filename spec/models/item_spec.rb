require 'rails_helper'

RSpec.describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品機能がうまくいくとき' do
      it '全ての機能がうまくいくとき' do
        expect(@item).to be_valid
      end
    end

    context '出品機能がうまくいかないとき' do
      it 'nameがない場合は保存できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationがないと保存できないこと' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'categoryがないと保存できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'statusがないと保存できないこと' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'delivery_feeがないと保存できないこと' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'shipping_areaがないと保存できないこと' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'days_to_shipsがないと保存できないこと' do
        @item.days_to_ships_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ships can't be blank")
      end
      it "catgoryで1が選択された場合は保存できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "statusで1が選択された場合は保存できないこと" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "shipping_areaで1が選択された場合は保存できないこと" do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it "delivery_feeで1が選択された場合は保存できないこと" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "days_to_shipsで1が選択された場合は保存できないこと" do
        @item.days_to_ships_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ships must be other than 1")
      end
      it 'priceがないと保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円未満は保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it 'priceが9999999円を超過すると保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end
      it 'priceは半角数字でないと保存できないこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '画像がないと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
