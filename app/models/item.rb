class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :date_of_shipment
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :item_status
  belongs_to_active_hash :prefecture
  belongs_to :user
end
