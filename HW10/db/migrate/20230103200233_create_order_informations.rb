class CreateOrderInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :order_informations do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.string :full_name
      t.string :phone
      t.string :city
      t.string :street
      t.string :house
      t.string :apartaments
      t.decimal :total, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
