class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      # t.string :image
      t.decimal :price, :precision => 8, :scale => 2
      t.belongs_to :category

      t.timestamps
    end
  end
end
