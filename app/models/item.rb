class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_to_ships
  belongs_to :user
  has_one_attached :image
  #バリデーションの設定
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price, format: {with: /\A[0-9]+\z/}, numericality: {only_integer: true, greater_than: 300, less_than: 9999999}

    with_options numericality: { other_than: 1} do
      validates :category
      validates :status
      validates :delivery_fee
      validates :shipping_area
      validates :days_to_ships
    end
  end
end