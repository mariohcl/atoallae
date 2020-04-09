class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :name
      t.string :image
      t.string :cover
      t.text :bio
      t.references :user, foreign_key: true
      t.string :instagram
      t.string :facebook
      t.string :twitter

      t.timestamps
    end
  end
end
