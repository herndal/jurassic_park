class CreateDinosaurs < ActiveRecord::Migration[6.0]
  def change
    create_table :dinosaurs do |t|
      t.string :name, null: false
      t.string :species, null: false
      t.integer :cage_id
      t.timestamps
    end
  end
end
