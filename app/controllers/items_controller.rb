class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy] 
  before_action :record_present, only: [:edit, :show] 


  def index
    @items = Item.includes(:user).order("created_at DESC")
    @records = Record.includes(:item)
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
  end

  def edit
    if @record.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else 
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id != @item.user_id
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(
      :product, :product_introduction,
      :category_id, :state_id, :delivery_fee_id,
      :delivery_source_id, :delivery_day_id,
      :price, :image
    ).merge(user_id: current_user.id)
  end

  def record_present
    @record = Record.find_by(item_id:@item.id)
  end
end
