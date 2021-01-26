class RecordAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, 
                :city, :block, :building, 
                :phone_number, :record_id, :user_id #:token

  with_options presence: true do
    validates :postcode, format: { with:/\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end
   # validates :token, presence: true

  def save
    record = Record.create(item_id: item_id,user_id: user_id )

    Address.create(postcode: postcode, prefecture_id: prefecture_id,
                   city: city, block: block, building: building,
                   phone_number: phone_number, record_id: record_id)
  end

end