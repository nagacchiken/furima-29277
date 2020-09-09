class ItemsController < ApplicationController
  def index
  end

  def new
    authenticate_user!
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:description,:category_id,:price,:item_status_id,:delivery_fee_id,:date_of_shipment_id, :shipping_region_id).merge(user_id: current_user.id)
  end
end
