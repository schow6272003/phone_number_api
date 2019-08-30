class CreatePhones < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |t|
        t.string :city
        t.integer :number
        t.timestamps
    end
  end
end
