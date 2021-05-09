class CreateSearchCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :search_categories do |t|

      t.timestamps
    end
  end
end
