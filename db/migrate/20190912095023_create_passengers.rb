class CreatePassengers < ActiveRecord::Migration[6.0]
  def change
    create_table :passengers do |t|
      t.integer :sex
      t.float :age
      t.integer :sibsp, default: 0
      t.integer :pclass
      t.float :fare
      t.string :embark_town
      t.boolean :survived

      t.timestamps
    end
    add_index :passengers, :sex
    add_index :passengers, :age
    add_index :passengers, :sibsp
    add_index :passengers, :pclass
    add_index :passengers, :fare
    add_index :passengers, :embark_town
    add_index :passengers, :survived
  end
end
