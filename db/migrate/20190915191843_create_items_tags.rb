class CreateItemsTags < ActiveRecord::Migration[6.0]
  def change
    create_table :items_tags do |t|
      t.references :item, index: true, null: false, foreign_key: true
      t.references :tag, index: true, null: false, foreign_key: true
    end
  end
end
