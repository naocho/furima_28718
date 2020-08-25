# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| --------------| ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| name          | string | null: false |
| kana name     | string | null: false |
| surname       | string | null: false |
| kana surname  | string | null: false |
| date           | string | null: false |
## has_many :items

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| price        | integer    | null: false                    |
| image        | string     | null: false                    |
##  belongs_to :user
##  has_one :purchase
##  has_many :shipping

## purchase テーブル

| Column   | Type       | Options      |
| -------- | ---------- | ------------ |
| sold out | references | null: false, |
| image    | references | null: false, |
## has_many :item

## shipping テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    |
| village       | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                    |
| phone_numder  | integer    | null: false                    |
## has_many :item