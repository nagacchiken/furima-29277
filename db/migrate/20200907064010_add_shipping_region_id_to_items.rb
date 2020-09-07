class AddShippingRegionIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :shipping_region_id, :string, null: false
  end
end
