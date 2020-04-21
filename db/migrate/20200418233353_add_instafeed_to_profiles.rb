class AddInstafeedToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :instafeed, :string
  end
end
