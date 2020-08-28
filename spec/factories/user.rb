FactoryBot.define do
  factory :user do
    nickname              {"abemaru"}
    email                 {"sample831@gmail.com"}
    password              {"sample0831"}
    password_confirmation {password}
    name                  {"伏見"}
    kana_name             {"フシミ"}
    surname               {"直樹"}
    kana_surname          {"ナオキ"}
    birthday              {"1933-06-06"}
  end
end

#ここの記述は全てテーブルを確認してそれに合うキーとカラムを入れる。