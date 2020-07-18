class CreateOffices < ActiveRecord::Migration[6.0]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :email
      t.integer :tell
      t.string :adress
      t.string :password_digest

      t.timestamps
    end
  end
end
