class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :cart
      t.belongs_to :user
      t.integer :order_status
      t.integer :payment_status

      t.timestamps
    end
  end
end
