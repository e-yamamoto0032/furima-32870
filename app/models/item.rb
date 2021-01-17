class Item < ApplicationRecord

  with_options presence: true do
    validates :product
    validates :product_introduction
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :delivery_source_id
    validates :delivery_day_id
    validates :price
  end

  belongs_to :user
  #has_one :record, dependent: :destroy
  has_one_attached :image

end
