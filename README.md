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
## has_many :items

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| price        | integer    | null: false                    |
| image        | string     | null: false                    |
| category     | integer    | null: false                    |
| status       | integer    | null: false                    |
| delivery fee | integer    | null: false                    |
| area         | integer    | null: false                    |
| delivery day | integer    | null: false                    |

### Association
##  belongs_to :user
##  has_one :purchase
##  has_many :shipping

## purchase テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
| sold_out | references | null: false,                   |
| image    | references | null: false,                   |

### Association
## has_many :items

## shipping テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| village       | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_numder  | integer    | null: false                    |

### Association
## has_many :items