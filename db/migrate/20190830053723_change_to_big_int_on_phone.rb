class ChangeToBigIntOnPhone < ActiveRecord::Migration[5.1]
  def up
    change_column :phones, :number, :integer, :limit => 8
  end

  def down
    change_column :phones, :number, :integer
  end 
end
