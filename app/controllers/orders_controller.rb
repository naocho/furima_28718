class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index]
  before_action :order_params, only: [:index, :create]
  #before_action、一番最初に起動させる様にする記述

  def index
    @intermediary = Intermediary.new

  end

  def create

    @intermediary = Intermediary.new(item_params)

    if @intermediary.valid?
      pay_item
      @intermediary.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
end

private

# def item_params
#   params.require(:intermediary).permit(:explanation, :category_id, :status_id, :delivery_fee_id, :area_id, :delivery_day_id, :price, :postal_code, :prefectures, :village, :address, :building_name, :phone_number, :token)
    #(params[:furima_id])のid部分に関してはルーティングのURI Patternのidで確認していれること。
    #またテーブルでユーザを指定してここでは入ってきているのでさらにidを指定する必要がある。
def item_params
  params.permit(:image, :name, :explanation, :category_id, :status_id, :delivery_fee_id, :delivery_day_id, :price, :postal_code, :prefecture_id, :village, :address, :building_name, :phone_number, :token, :furima_id).merge(user_id: current_user.id)
  #attr_accessorとここのIDは全て一致させる。
end

def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
end


def order_params
  @item = Furima.find(params[:furima_id])
end
# def order_params
#   params.permit(:price, :token)
# end

def pay_item
  Payjp.api_key = "sk_test_7093660ea00d4c1beb092581"  # PAY.JPテスト秘密鍵
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: item_params[:token],    # カードトークン
    currency:'jpy'                 # 通貨の種類(日本円)
  )
end

