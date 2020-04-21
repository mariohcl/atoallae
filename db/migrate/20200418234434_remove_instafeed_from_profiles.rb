class RemoveInstafeedFromProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :instafeed, :string
  end
end
