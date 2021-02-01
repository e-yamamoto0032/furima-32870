class RecordAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, 
                :city, :block, :building, 
                :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postcode, format: { with:/\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :block
    validates :token
    validates :user_id
    validates :item_id
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    record = Record.create(item_id: item_id, user_id: user_id)

    Address.create(postcode: postcode, prefecture_id: prefecture_id,
                   city: city, block: block, building: building,
                   phone_number: phone_number, record_id: record.id)
  end

end