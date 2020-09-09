FactoryBot.define do
  factory :order do
    postal_code               {"987-3456"}
    prefecture_id             {"2"}
    village                   {"青森県"}
    address                   {"東住吉区矢田1"}
    building_name             {"高居ビル"}
    phone_number              {"09088889090"}
    token                     {"token"}
    # user_id
    # furima_id
  end
  # rspecのアソシエーションの組み方を探す
end
