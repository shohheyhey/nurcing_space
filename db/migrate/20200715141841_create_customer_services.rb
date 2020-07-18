class CreateCustomerServices < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_services do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
