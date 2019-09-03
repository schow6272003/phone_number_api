class RemoveCityFromPhoneTable < ActiveRecord::Migration[5.1]
  def up
    remove_column :phones, :city, :string
  end

  def down
    add_column :phones, :city, :string
  end 
end
