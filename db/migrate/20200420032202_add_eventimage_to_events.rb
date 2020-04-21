class AddEventimageToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :eventimage, :string
  end
end
