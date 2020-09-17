class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :date_of_shipment
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :item_status
  belongs_to_active_hash :prefecture
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  validates :image, :name, :description, :price, presence: true
  validates :category_id, :item_status_id, :delivery_fee_id, :date_of_shipment_id, :prefecture_id, exclusion: { in: [1] }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, format: { with: /\A[0-9]+\z/ }
end
