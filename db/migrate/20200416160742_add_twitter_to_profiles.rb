class AddTwitterToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :twitter, :string
  end
end
