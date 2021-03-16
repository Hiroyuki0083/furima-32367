class CreateFurimas < ActiveRecord::Migration[6.0]
  def change
    create_table :furimas do |t|
      t.string :name
      t.string :text
      t.text :image
      t.string :user, foreign_key: true
      t.timestamps
    end
  end
end

# ７行目：一意性