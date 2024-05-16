class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :days_until_shipping
  belongs_to :user

  validates :image, presence: true
  validates :product_name, presence: true
  validates :product_introduction, presence: true
  validates :category_id, presence: true
  validates :product_condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_until_shipping_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  validates :category_id, :product_condition_id, :prefecture_id, :shipping_charge_id, :days_until_shipping_id, numericality: { other_than: 1 , message: "can't be blank" }
end
