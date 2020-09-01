#SyntaxErrorはdoとendの数があっていないかなどの文法エラー
require 'rails_helper'
describe Furima, type: :model do
  before do
    @furima = FactoryBot.build(:furima)
    @furima.image = fixture_file_upload('public/images/0edcdd340e0cdf3f2e3cfe4795012e9e.png')
    end

  describe '商品出品機能' do
    context '新規登録がうまくいくとき' do
      it "カラムが全て存在すれば登録できる" do
        expect(@furima).to be_valid
      end
      it "商品名がある" do
        @furima.name = "スイッチ"
        expect(@furima).to be_valid
      end
      it "商品の説明がある" do
        @furima.explanation = "ゲーム"
        expect(@furima).to be_valid
      end
      it "カテゴリーの記述がある" do
        @furima.category_id  = "2"
        expect(@furima).to be_valid
      end
      it "状態の記述がある" do
        @furima.status_id  = "2"
        expect(@furima).to be_valid
      end
      it "配達方法の記述がある" do
        @furima.delivery_fee_id = "3"
        expect(@furima).to be_valid
      end
      it "発送先の記述がある" do
        @furima.area_id = "2"
        expect(@furima).to be_valid
      end
      it "発送日の記述がある" do
        @furima.delivery_day_id = "2"
        expect(@furima).to be_valid
      end
      it "金額の記述がある" do
        @furima.price = "300"
        expect(@furima).to be_valid
      end
    end

    context '新規登録が上手く行かない時' do
  
      #エラーコードについては一度エラーを出してからexpected ["ここをincludeにかく"]
      it "商品名が必須である事" do
        @furima.name = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Name can't be blank")
      end

      it "商品の説明が必須である事" do
        @furima.explanation = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Explanation can't be blank")
      end

      it "カテゴリーの情報が必須である事" do
        @furima.category_id = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end

      it "商品の状態についての情報が必須" do
        @furima.status_id = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end

      it "配送料の負担についての情報が必須" do
        @furima.delivery_fee_id = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Delivery fee can't be blank", "Delivery fee is not a number")
      end

      it "発送元の地域について情報が必須" do
        @furima.area_id = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end

      it "発送までの日数についての情報が必須" do
        @furima.delivery_day_id = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Delivery day can't be blank", "Delivery day is not a number")
      end

      it "価格についての情報が必須" do
        @furima.price  = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price can't be blank", "Price is invalid")
      end

      it "価格の範囲が300~9999999以外である時" do
        @furima.price  = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price is invalid")
      end
      it "価格の範囲が300~9999999以外である時" do
        @furima.price  = 99999999999999999
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price is invalid")
      end
      it "販売価格は半角数字のみ" do
        @furima.price  = 'aiks'
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price is invalid")
      end
    end
  end
end