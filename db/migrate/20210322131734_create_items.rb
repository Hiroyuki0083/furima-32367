class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.information :text
      t.integer :status_id
      t.integer :price
      t.integer :shipping_charge_id
      t.integer :shipping_area_id
      t.integer :shipping_day_id
      t.integer :category_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
