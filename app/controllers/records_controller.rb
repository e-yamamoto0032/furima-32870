class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @record = Record.find_by(item_id:@item.id)
    if current_user.id == @item.user_id || @record.present?
      redirect_to root_path
    else
      @record_address = RecordAddress.new
    end
  end

  def create
    @record_address = RecordAddress.new(address_params)
    if @record_address.valid?
      @record_address.save
      set_payjp
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.require(:record_address).permit(
                                    :postcode, :prefecture_id, 
                                    :city, :block, :building, 
                                    :phone_number
                                  ).merge(user_id: current_user.id,
                                          item_id:params[:item_id],
                                          token: params[:token]
                                  )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_payjp #Payjpの記述
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item[:price], 
    card: address_params[:token], 
    currency: 'jpy'
    )
  end
end
