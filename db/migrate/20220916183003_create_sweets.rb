class CreateSweets < ActiveRecord::Migration[5.2]
  def change
    create_table :sweets do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
