class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :street_address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: { message: "can't be blank" } do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'ハイフン無し10桁以上11桁以内の半角数値で入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :street_address
    validates :user_id
    validates :item_id
  end

  validates :token, presence: true

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Shipping.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, building_name: building_name, phone_number: phone_number)
  end
end