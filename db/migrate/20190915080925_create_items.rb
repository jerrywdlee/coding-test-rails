class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end
    add_index :items, :name
    add_index :items, :price
  end
end
