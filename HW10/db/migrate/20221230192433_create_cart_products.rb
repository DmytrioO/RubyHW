class CreateCartProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_products do |t|
      t.belongs_to :cart, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true
      t.string :name
      t.string :image
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :quantity

      t.timestamps
    end
  end
end
