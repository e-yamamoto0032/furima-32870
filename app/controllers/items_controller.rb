class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

  def item_params
    params.require(:item).permit(
      :product, :product_introduction,
      :category_id, :state_id, :delivery_fee_id,
      :delivery_source_id, :delivery_day_id,
      :price, :image
    ).merge(user_id: current_user.id)
  end
end
