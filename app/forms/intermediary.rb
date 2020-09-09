class Intermediary
  include ActiveModel::Model
  #この記述もフォームオブジェクトで必要な記述
  attr_accessor :postal_code, :prefecture_id, :village, :address, :building_name, :phone_number, :token, :furima_id, :user_id
  #これは連結させるテーブルのカラムを全部書く

  with_options presence: true do 
    validates :postal_code,                format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id,              numericality: { other_than: 1 } 
    validates :village       
    validates :address        
    validates :phone_number,               format: { with: /\A\d{10,11}\z/}
    validates :token
  end 

  def save
    # binding.pry
    # Furima.create(image: image, name: name, explanation: explanation, category_id: category_id, status_id: status_id, delivery_fee_id: delivery_fee_id, delivery_day_id: delivery_day_id, price: price)
    contact = Contact.create(furima_id: furima_id, user_id: user_id)
    #中間テーブルも変数に変えてidにしてフォームオブジェクトに入れる必要あり。
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, village: village, address: address, building_name: building_name, phone_number: phone_number, contact_id: contact.id)
  end
end