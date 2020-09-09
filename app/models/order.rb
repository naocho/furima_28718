class Order < ApplicationRecord
  belongs_to :contact
  # belongs_to :intermediary
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end

