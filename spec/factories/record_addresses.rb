FactoryBot.define do
  factory :record_address do
    postcode      { '100-0000' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    block         { Faker::Address.street_address }
    phone_number  { "09012345678"}
    token         { 'ENV["PAYJP_SECRET_KEY"]'}
  end
end

# スライド　option + カーソル
# インデント　選択してからtab
# 複製　shift + option + カーソル