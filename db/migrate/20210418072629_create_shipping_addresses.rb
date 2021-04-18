class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.integer :customer_id
      t.integer :name
      t.string :address
      t.string :postal_code

      t.timestamps
    end
  end
end
