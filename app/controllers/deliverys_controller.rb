class DeliverysController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_find, only: [:create, :index]
  before_action :sold_out_item, only: [:index]

  def index
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @purchase_delivery = PurchaseDelivery.new(delivery_params)
    if @purchase_delivery.valid? 
      pay_item
      @purchase_delivery.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  private

  def delivery_params
   params.require(:purchase_delivery).permit(:postal_code, :shipping_area_id, :municipalities, :address, :phone_number, :building_name, :item_id).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item_find[:price],
      card: delivery_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out_item
    redirect_to root_path if @item.purchase.present?
  end
end 