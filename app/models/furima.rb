class Furima < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アクティブハッシュのgemを使用していた場合はbelongs_to_active_hashは一つ一つ書く
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_day

  belongs_to :user  # usersテーブルとのアソシエーション
  # has_one :intermediary
  has_one :contact
  has_one_attached :image  # Active StorageのGemを導入した際に作れるアソシエーション
  #後ろのシンボルはアップロードするときのキーと紐付ける

  
  with_options presence: true do 
    validates :image                  
    validates :name,                  format: { with: /\A[ぁ-んァ-ン一-龥]{,40}/, message: '商品名が入力されてません'}
    validates :explanation,           format: { with: /\A[ぁ-んァ-ン一-龥]{,1000}/} 
    validates :category_id,           numericality: { other_than: 1 } 
    validates :status_id,             numericality: { other_than: 1 } 
    validates :delivery_fee_id,       numericality: { other_than: 1 } 
    validates :area_id,               numericality: { other_than: 1 } 
    validates :delivery_day_id,       numericality: { other_than: 1 } 
    validates :price,                 format: { with: /\A[0-9]{3,7}\z/}
  end
end
