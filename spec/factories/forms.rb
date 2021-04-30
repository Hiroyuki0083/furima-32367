FactoryBot.define do
  factory :form do
    post_number           { '111-1111' }
    shipping_area_id      { 2 }
    municipality          { 'サンプル' }
    address               { 'サンプル111' }
    telephone_number      { '11111111111' }
    token                 { 'sk_aaaaa11111' }
  end
end
