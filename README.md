# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| --------------| ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| name          | string | null: false |
| kana_name     | string | null: false |
| surname       | string | null: false |
| kana_surname  | string | null: false |
| birtday       | date   | null: false |

### Association
## has_many :furima
## has_many :intermediary

## furima テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| name         | string     | null: false                    |
| explanation  | text       | null: false                    |
| price        | integer    | null: false                    |
| image        | string     | null: false                    |
| category     | integer    | null: false                    |
| status       | integer    | null: false                    |
| delivery fee | integer    | null: false                    |
| area         | integer    | null: false                    |
| delivery day | integer    | null: false                    |

### Association
##  belongs_to :user
##  has_one :intermediary

## intermediary テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| furima   | references | null: false, foreign_key: true |

t.references :user,   null: false, foreign_key: true
t.references :furima,   null: false, foreign_key: true

### Association
## belongs_to :furima
## belongs_to :user
## has_one :shipping

## shipping テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| intermediary  | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    |
| prefectures   | integer    | null: false                    |
| village       | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_numder  | string     | null: false                    |

### Association
## belongs_to :intermediary
