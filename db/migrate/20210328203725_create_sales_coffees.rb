class CreateSalesCoffees < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_coffees do |t|
      t.string :origin
      t.integer :price
      t.string :blend_name
      t.datetime :date_time

      t.timestamps
    end
  end
end
