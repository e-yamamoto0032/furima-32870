require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録がうまくいくとき' do
      it "項目が全て入力できていれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it "画像が選択されていなければ登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空だと登録できない" do
        @item.product = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it "商品の説明が空だと登録できない" do
        @item.product_introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product introduction can't be blank")
      end
      it "カテゴリーが選択できていない(idが1の場合)と登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "商品の状態が選択できていない(idが1の場合)と登録できない" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State Select")
      end
      it "配送料の負担が選択できていない(idが1の場合)と登録できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee Select")
      end
      it "発送元の地域が選択できていない(idが1の場合)と登録できない" do
        @item.delivery_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery source Select")
      end
      it "発送までの日数が選択できていない(idが1の場合)と登録できない" do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day Select")
      end
      it "料金が空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "料金が全角文字だと登録できない" do
        @item.price = "１００００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "料金が半角の数字以外だと登録できない" do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "料金が300未満だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "料金が9999999より大きいと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
