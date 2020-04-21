class AddMapToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :map, :string
  end
end
