class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :amount
      t.text :address
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
