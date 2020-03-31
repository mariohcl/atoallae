class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.integer :price, default:0
      t.boolean :enable, default:true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
