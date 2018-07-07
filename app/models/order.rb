class Order < ApplicationRecord
  has_one :order_status
  has_one :customer
  has_many :order_items
end
