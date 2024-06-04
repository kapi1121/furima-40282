class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :street_address, :building_name, :phone_number, :user_id, :item_id

  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :prefecture_id, presence: { message: "can't be blank" }, numericality: { other_than: 0, message: "can't be blank" }
  validates :municipality, presence: { message: "can't be blank" }
  validates :street_address, presence: { message: "can't be blank" }
  validates :phone_number, presence: { message: "can't be blank" }, format: { with: /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/ }, length: { maximum: 11 }
  validates :user_id, presence: { message: "can't be blank" }
  validates :item_id, presence: { message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    shipping = Shipping.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, building_name: building_name, phone_number: phone_number, user_id: user_id, item_id: item_id)
  end
end