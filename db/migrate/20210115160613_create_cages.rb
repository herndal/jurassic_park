class CreateCages < ActiveRecord::Migration[6.0]
  def change
    create_table :cages do |t|
      t.integer :capacity, null: false
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end
