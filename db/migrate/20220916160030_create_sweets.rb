class CreateSweets < ActiveRecord::Migration[5.2]
  def change
    create_table :sweets do |t|
      t.string :name
      t.text :description
      t.decimal8 :price
      t.decimal2 :price
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
