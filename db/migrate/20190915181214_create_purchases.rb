class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :item_id
      t.integer :address_id
      t.integer :number

      t.timestamps
    end
    add_index :purchases, :item_id
    add_index :purchases, :address_id
    add_index :purchases, :number
  end
end
