# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| surname  | string | null: false |
| birtday  | string | null: false |
## has_many :item
## has_many :shipping

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| purchase_id  | references | null: false, foreign_key: true |
| shipping_id  | references | null: false, foreign_key: true |
| price        | integer    | null: false                    |
| category     | string     | null: false                    |
| status       | string     | null: false                    |
| delivery fee | integer    | null: false                    |
| area         | string     | null: false                    |
| delivery day | date       | null: false                    |
| image        | string     | null: false                    |
##  belongs_to :user
##  belongs_to :purchase
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
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |
| postal code   | string     | null: false                    |
| prefectures   | string     | null: false                    |
| village       | string     | null: false                    |
| address       | string     | null: false                    |
| building name | string     | null: false                    |
| phone numder  | integer    | null: false                    |
## belong_to :user
## has_many :item