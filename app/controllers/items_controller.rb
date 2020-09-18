class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :transactions, :transactions_create]
  before_action :move_to_index, except: [:index, :show, :new, :create, :transactions, :transactions_create]
  before_action :move_to_index_sell, only: [:transactions, :transactions_create]
  def index
    @items = Item.all
    @purchases = Purchase.all
  end

  def new
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def transactions
    @item = Item.find(params[:id])
    @purchase = UserPurchase.new
  end

  def transactions_create
    @purchase = UserPurchase.new(purchase_params)

    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :transactions
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :price, :item_status_id, :delivery_fee_id, :date_of_shipment_id, :prefecture_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user.id
  end

  def move_to_index_sell
    @item = Item.find(params[:id])
    if current_user.id == @item.user.id
      redirect_to action: :index
      return
    end
    redirect_to action: :index if @item.purchase.present?
  end

  def purchase_params
    @item = Item.find(params[:id])
    params.require(:user_purchase).permit(:token, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(price: @item.price, item_id: @item.id, user_id: current_user.id)
  end

  def pay_item
    binding.pry
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
