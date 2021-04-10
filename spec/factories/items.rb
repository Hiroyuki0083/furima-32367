FactoryBot.define do
  factory :item do
    name                        { 'test' }
    information                 { 'test' }
    status_id                   { 2 }
    price                       { 11111 }
    shipping_charge_id          { 2 }
    shipping_area_id            { 2 }
    shipping_day_id             { 2 }
    category_id                 { 2 }

    after(:build) do |message|
      message.image.attach(io: File.open('/Users/uenohiroyuki/projects/furimaの素材/images/dl-android.png'), filename: 'dl-android.png')
    end

    association :user
    
  end
end
