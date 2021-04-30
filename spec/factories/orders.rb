FactoryBot.define do
  factory :order do
    post_number           { '111-1111' }
    shipping_area_id      { 2 }
    municipality          { 'サンプル' }
    address               { 'サンプル111' }
    telephone_number      { 11111111111 }
    price {3000}
    token {"tok_abcdefghijk00000000000000000"}
    bilding_name { 'サンプル' }
  end
end
