class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :phone
      t.integer :prefecture_id
      t.string :city

      t.timestamps
    end
    add_index :addresses, :customer_id
    add_index :addresses, :prefecture_id
  end
end
