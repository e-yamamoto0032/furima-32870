FactoryBot.define do
  factory :record_address do
    postcode      { '100-0000' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    block         { Faker::Address.street_address }
    building      { Faker::Address.building_number }
    phone_number  { "09012345678"}
    user_id       { 1 }
    item_id       { 1 }
    token         { 'ENV["PAYJP_SECRET_KEY"]'}
  end
end