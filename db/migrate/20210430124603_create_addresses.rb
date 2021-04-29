class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_number,          null: false
      t.integer :shipping_area_id,    null: false
      t.string :municipality,         null: false
      t.string :address,              null: false
      t.string :building_name
      t.string :telephone_number,     null: false
      t.references :buy_management,   foreign_key: true
      t.timestamps
    end
  end
end
