class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_to_ships
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  # バリデーションの設定
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than: 299, less_than: 10_000_000 }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :shipping_area_id
      validates :days_to_ships_id
    end
  end
end
