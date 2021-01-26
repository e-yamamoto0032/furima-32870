class RecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(address_params)
    if @record_address.valid?
     # Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     # Payjp::Charge.create(
     # amount: card_params[:price], 
     # card: card_params[:token], 
     # currency: 'jpy'
     # )
      @record_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def address_params
    params.require(:record_address).permit(
                                    :postcode, :prefecture_id, 
                                    :city, :block, :building, 
                                    :phone_number, :record_id
                                  ).merge(user_id: current_user.id) # token: params[:token])
  end

end
