class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_number
      t.integer  :shipping_area_id
      t.string :municipality
      t.string :address
      t.string :building_name
      t.string :telephone_number
      t.references :buy_management
      t.timestamps
    end
  end
end
