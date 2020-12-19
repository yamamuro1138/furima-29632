class PurchaseDelivery

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :shipping_area_id, :municipalities, :address, :phone_number, :building_name, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /-/ }
    validates :phone_number, length: {maximum: 11 }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :municipalities, :address, :user_id, :item_id, :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipalities: municipalities, address: address, phone_number: phone_number, purchase_id: purchase.id, building_name: building_name)
  end
end
