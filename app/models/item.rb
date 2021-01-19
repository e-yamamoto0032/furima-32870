class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :product
    validates :product_introduction
    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :state_id
      validates :delivery_fee_id
      validates :delivery_source_id
      validates :delivery_day_id
    end
    validates :price, numericality: {
      only_interger: true,
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9_999_999
    }
  end

  belongs_to :user
  # has_one :record, dependent: :destroy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :delivery_source
  belongs_to :delivery_day
end
