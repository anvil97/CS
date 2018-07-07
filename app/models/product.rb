class Product < ApplicationRecord
  belongs_to :type
  has_many :order_items
  has_one_attached :image
end
