class Contact < ApplicationRecord
  belongs_to :furima
  belongs_to :user
  has_one :order
end
