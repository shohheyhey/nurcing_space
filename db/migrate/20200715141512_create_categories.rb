class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.references :office, foreign_key: true
      t.string :name

      # t.timestamps, default: Datetime.now
      t.datetime :created_at, default: DateTime.now
      t.datetime :updated_at, default: DateTime.now
    end
  end
end
