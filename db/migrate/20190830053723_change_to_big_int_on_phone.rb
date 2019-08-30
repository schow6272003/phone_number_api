class ChangeToBigIntOnPhone < ActiveRecord::Migration[5.1]
  def up
    change_column_null :phones, :number, :bigint 
  end

  def down
    change_column_null :phones, :number, :bigint
  end 
end
