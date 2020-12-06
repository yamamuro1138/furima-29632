class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def create
  end

  def new
    @item = Item.new
  end

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end