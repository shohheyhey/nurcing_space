class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.references :category, null: false, foreign_key: true
      t.references :office, null: false, foreign_key: true
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
