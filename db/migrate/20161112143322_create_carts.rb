class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.string :phone
      t.string :name
      t.string :status
      t.timestamps
    end
  end
end
