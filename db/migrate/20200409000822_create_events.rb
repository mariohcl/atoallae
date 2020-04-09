class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :description
      t.string :place
      t.string :date
      t.references :page, foreign_key: true

      t.timestamps
    end
  end
end
