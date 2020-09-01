FactoryBot.define do
  factory :furima do
    # image                {"abemaru"}
    name                 {"スイッチ"}
    explanation          {"ゲーム"}
    category_id          {"2"}
    status_id            {"2"}
    delivery_fee_id      {"3"}
    area_id              {"2"}
    delivery_day_id      {"2"}
    price                {"300"}
    association :user
    # association :image
  end
end