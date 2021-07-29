class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :product_id
      t.string :product_name
      t.integer :product_price
      t.string :product_company
      t.text :product_text

      
      t.timestamps
    end
  end
end
