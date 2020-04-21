class AddFacebookToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :facebook, :string
  end
end
