class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_shipping_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_shipping_params
    params.require(:purchase_shipping).permit(:post_code, :prefecture_id, :municipality, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_params
    params.require(:item).permit(:product_name, :category_id, :price, :product_introduction, :product_condition_id,
                                 :shipping_charge_id, :prefecture_id, :days_until_shipping_id, :image).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_shipping_params[:token],
      currency: 'jpy'
    )
  end
end