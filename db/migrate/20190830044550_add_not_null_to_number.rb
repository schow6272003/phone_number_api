class AddNotNullToNumber < ActiveRecord::Migration[5.1]
  def up
    change_column_null :phones, :number, false
  end

  def down
    change_column_null :phones, :number, true
  end 
end
