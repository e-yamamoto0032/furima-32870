class RecordAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, 
                :city, :block, :building, 
                :phone_number

  with_options presence: true do
    validates :postcode, format: { with:/\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

end