class Record < ApplicationRecord
  has_one :address, dependent: :destroy
end
