class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :days_to_ships_id).merge(user_id: current_user.id)
  end
end