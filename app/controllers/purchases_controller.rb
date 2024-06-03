class PurchasesController < ApplicationController
  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_shipping_params)
    if @donation_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def purchase_shipping_params
    params.require(:purchase_shipping).permit(:post_code, :prefecture_id, :municipality, :street_address, :building_name, :phone_number, :user_id, :item_id)
  end
end