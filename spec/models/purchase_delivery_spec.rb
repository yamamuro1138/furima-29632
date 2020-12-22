require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  describe '商品購入機能' do
    before do
      @pd = FactoryBot.build(:purchase_delivery)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@pd).to be_valid
    end
    it 'building_nameが空でも購入できること' do
      @pd.building_name = nil
      expect(@pd).to be_valid
    end
    it 'postal_codeが空だと購入できない' do
      @pd.postal_code = ''
      @pd.valid?
      expect(@pd.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにはハイフンがないと購入できない' do
      @pd.postal_code = "1234567"
      @pd.valid?
      expect(@pd.errors.full_messages).to include("Postal code is invalid")
    end
    it 'shipping_areaが空だと購入できない' do
      @pd.shipping_area_id = ''
      @pd.valid?
      expect(@pd.errors.full_messages).to include("Shipping area can't be blank")
    end
    it 'shipping_areaで1が選択された場合は保存できないこと' do
      @pd.shipping_area_id = 1
      @pd.valid?
      expect(@pd.errors.full_messages).to include('Shipping area must be other than 1')
    end
    it 'addressが空だと購入できない' do
      @pd.address = ''
      @pd.valid?
      expect(@pd.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと購入できない' do
      @pd.phone_number = ''
      @pd.valid?
      expect(@pd.errors.full_messages).to include("Phone number can't be blank")
    end 
    it 'phone_numberはハイフンが不要であること' do
      @pd.phone_number = '123-4567-8910'
      @pd.valid?
      expect(@pd.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it 'phone_numberは11桁以内でないと購入できないこと' do
      @pd.phone_number = '123456789101'
      @pd.valid?
      expect(@pd.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it 'tokenが空では購入できないこと' do
      @pd.token = ''
      @pd.valid?
      expect(@pd.errors.full_messages).to include("Token can't be blank")
    end
  end
end
