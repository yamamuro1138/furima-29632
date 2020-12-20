class DeliverysController < ApplicationController
  
  def index
    item_find
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @purchase_delivery = PurchaseDelivery.new(delivery_params)
    if @purchase_delivery.valid? 
      @purchase_delivery.save
      return redirect_to root_path
    else
      item_find
      render 'index'
    end
  end
  private

  def delivery_params
   params.require(:purchase_delivery).permit(:postal_code, :shipping_area_id, :municipalities, :address, :phone_number, :building_name, :purchase_id, :item_id).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
