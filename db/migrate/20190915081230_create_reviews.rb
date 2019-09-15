class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :item_id
      t.integer :customer_id
      t.integer :score
      t.string :text

      t.timestamps
    end
    add_index :reviews, :item_id
    add_index :reviews, :customer_id
    add_index :reviews, :score
  end
end
