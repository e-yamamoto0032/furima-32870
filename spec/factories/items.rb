FactoryBot.define do
  factory :item do
    product              { 'テスト' }
    product_introduction { 'テストの説明' }
    category_id          { 2 }
    state_id             { 2 }
    delivery_fee_id      { 2 }
    delivery_source_id   { 2 }
    delivery_day_id      { 2 }
    price                { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test.png'), filename: 'test.png')
    end
  end
end
