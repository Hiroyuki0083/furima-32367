FactoryBot.define do
  factory :item do
    name                        { 'test' }
    information                 { 'test' }
    status_id                   { '新品未使用' }
    price                       { '11111' }
    shipping_charge_id          { '購入者' }
    shipping_area_id            { '東京都' }
    shipping_day_id             { '1〜2以内に発送' }
    category_id                 { 'ファッション' }

    after(:build) do |message|
      message.image.attach(io: File.open('/Users/uenohiroyuki/projects/furimaの素材/images/dl-android.png'), filename: 'dl-android.png')
    end

    association :user
    
  end
end
