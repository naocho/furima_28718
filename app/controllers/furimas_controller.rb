# コントローラを作る際は絶対に複数形にしてsをつける事
# またコントローラとモデルは全て名前を統一させる事
class FurimasController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

def index
  @items = Furima.all.order("created_at DESC")
end

def new
  @item = Furima.new
end

def create

  @item = Furima.new(item_params)
  # Item.create(item_params)
  if @item.valid?
    @item.save
    redirect_to furimas_path
  else
    render :new
    #renderは同じview起動する、newは新たに作るコード、エラーを起動するならこれ
  end

end

def destroy

end
#unless user_signed_in?
#   redirect_to hoge_path
# end
#購入画面のコントローラにて入れて、ログインしていないユーザーをサインインに飛ばす

def edit

end

def update

end

def show
  @item = Furima.find(params[:id])
  #findメソッドはモデル名.find(レコード:id)と言う書き方
end

private

def item_params
  params.require(:furima).permit(:image, :name, :explanation, :category_id, :status_id, :delivery_fee_id, :area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  #retquireが繋げたいモデル、permitがカラム、mergeがモデル同士を繋げた時のつなげるモデルを記述
end
#ストロングパラメーターuserはcreateしなくて良い？

def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
end

end