class AddLongbioToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :longbio, :string
  end
end
