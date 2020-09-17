class UserPurchase

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :purchase_id, :price,:token
  


  with_options presence: true do
    # カード情報
    validates :token
    # 配送先住所
    validates :postal_code,format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address
    validates :phone_number,format: { with: /\A[0-9]+\z/ }
    validates :prefecture_id, exclusion: { in: [1] }
  end

  def save
    
   
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,phone_number: phone_number,purchase_id: purchase.id)
    
  end
end