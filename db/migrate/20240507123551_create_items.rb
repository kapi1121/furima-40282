class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :product_name,            null: false 
      t.integer :category_id,            null: false 
      t.integer :price,                  null: false 
      t.text :product_introduction,      null: false 
      t.integer :product_condition_id,   null: false 
      t.integer :shipping_charge_id,     null: false 
      t.integer :prefecture_id,          null: false 
      t.integer :days_until_shipping_id, null: false       
      t.timestamps
    end
  end
end
