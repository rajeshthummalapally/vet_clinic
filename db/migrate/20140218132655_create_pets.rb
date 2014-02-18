class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name,              null: false
      t.string :pet_type,          null: false
      t.string :breed,             null: false
      t.integer :age,              default: 1
      t.string :weight,            null: false
      t.datetime :date_last_visit, null: false

      t.timestamps
    end
    add_index :pets, :name
  end
end
