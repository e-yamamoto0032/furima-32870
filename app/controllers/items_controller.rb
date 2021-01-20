class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def show
  # end

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
