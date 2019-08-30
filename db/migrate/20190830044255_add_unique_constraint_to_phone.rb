class AddUniqueConstraintToPhone < ActiveRecord::Migration[5.1]
  def up
    add_index :phones, :number, :unique => true
  end

  def down
    remove_index :phones, :number, :unique => true
  end 
end
