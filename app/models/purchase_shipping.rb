class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :street_address, :building_name, :phone_number, :user_id, :item_id

  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :municipality, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/ }, length: { maximum: 11 }
  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    shipping = Shipping.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, building_name: building_name, phone_number: phone_number, user_id: user_id, item_id: item_id)
  end
end