require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    @record_address = FactoryBot.build(:record_address)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "postcode,prefecture_id,city,block,phone_number,tokenが正しく入力されていれば登録できる" do
        expect(@record_address).to be_valid
      end
      it "電話番号が10桁でも登録できる" do
        @record_address.phone_number = "0901234567"
        expect(@record_address).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it 'postcodeが空だと登録できない' do
        @record_address.postcode = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postcode is invalid")
      end
      it 'postcodeが半角数字でなければ登録できない' do
        @record_address.postcode = '１００−００００'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postcode is invalid")
      end
      it 'postcodeが「-」の前に3つ、後に4つ半角数字が入力できていなければ登録できない' do
        @record_address.postcode = '1000-000'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postcode is invalid")
      end
      it 'prefecture_idが選択できていなければ（idが１の場合）登録できない' do
        @record_address.prefecture_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityが空だと登録できない' do
        @record_address.city = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと登録できない' do
        @record_address.block = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと登録できない' do
        @record_address.phone_number = '０９０００００００００'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberに「-」があると登録できない' do
        @record_address.phone_number = '090-0000-0000'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが9桁以下だと登録できない' do
        @record_address.phone_number = '090123456'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
