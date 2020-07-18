class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.references :service, null: true, foreign_key: true
      t.references :office, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :image
      t.string :name
      t.integer :age
      t.date :birth
      t.string :adress
      t.integer :kaigodo
      t.text :kioreki
      t.text :description

      t.timestamps
    end
  end
end
