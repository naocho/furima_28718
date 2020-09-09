require 'rails_helper'

describe Intermediary, type: :model do
  before do
    @user = FactoryBot.create(:user)
    #createはモデルに入れる様にする記述
    @furima = FactoryBot.build(:furima)
    #buildはただ表示する事だけをする記述
    @furima.image = fixture_file_upload('public/images/0edcdd340e0cdf3f2e3cfe4795012e9e.png')
    #imageはfactoriybotでは指定しない。ここで指定する。
    # @contact = FactoryBot.create(user_id: @user_id, furima_id: @furima＿id)
    # @order = FactoryBot.build(:order)
    # @intermediary = FactoryBot.build(:intermediary, user_id: @user.id, furima_id: @furima.id)
    @intermediary = FactoryBot.build(:intermediary)
  end

  describe '商品購入機能' do
      context '新規登録がうまくいくとき' do
        it "カラムが全て存在すれば登録できる" do
          expect(@intermediary).to be_valid
        end
        it "郵便番号がある" do
          @intermediary.postal_code = "987-3456"
          expect(@intermediary).to be_valid
        end
        it "都道府県がある" do
          @intermediary.prefecture_id = "2"
          expect(@intermediary).to be_valid
        end
        it "市区町村がある" do
          @intermediary.village = "青森県"
          expect(@intermediary).to be_valid
        end
        it "番地がある" do
          @intermediary.address = "東住吉区矢田1"
          expect(@intermediary).to be_valid
        end
        it "建物名がある" do
          @intermediary.building_name = "高居ビル"
          expect(@intermediary).to be_valid
        end
        it "建物名がない" do
          @intermediary.building_name = nil
          expect(@intermediary).to be_valid
        end
        it "電話番号がある" do
          @intermediary.phone_number = "09088889090"
          expect(@intermediary).to be_valid
        end
        it "トークンがある" do
          @intermediary.token = "トークン"
          expect(@intermediary).to be_valid
        end
      end
  
      context '新規登録が上手く行かない時' do


    it "郵便番号がない" do
      @intermediary.postal_code  = nil
      @intermediary.valid?
      expect(@intermediary.errors.full_messages).to include("Postal code can't be blank")
    end
    it "郵便番号が合わない" do
      @intermediary.postal_code  = "9876532"
      @intermediary.valid?
      expect(@intermediary.errors.full_messages).to include("Postal code is invalid")
    end
     it "都道府県がない。" do
      @intermediary.prefecture_id  = nil
      @intermediary.valid?
      expect(@intermediary.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
     end
     it "都道府県の指定が最初に入っている時" do
      @intermediary.prefecture_id  = 1
      @intermediary.valid?
      expect(@intermediary.errors.full_messages).to include("Prefecture must be other than 1")
     end
    it "市区町村がない" do
      @intermediary.village = nil
      @intermediary.valid?
      expect(@intermediary.errors.full_messages).to include("Village can't be blank")
    end
    it "番地がない" do
      @intermediary.address  = nil
      @intermediary.valid?
      expect(@intermediary.errors.full_messages).to include("Address can't be blank")
    end
    it "電話番号がない" do
      @intermediary.phone_number  = nil
      @intermediary.valid?
      expect(@intermediary.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
    end
      it "電話番号がおかしく記入されてる時。" do
      @intermediary.postal_code  = "0908888336378"
      @intermediary.valid?
      expect(@intermediary.errors.full_messages).to include("Postal code is invalid")    
      end
    it "トークンがない" do
      @intermediary.token  = nil
      @intermediary.valid?
      expect(@intermediary.errors.full_messages).to include("Token can't be blank") 
      end
    end
  end
end
