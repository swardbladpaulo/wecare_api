class AddProfilePageAttributes < ActiveRecord::Migration[6.0]
  def change 
    change_table :users do |t|
      t.string :adress
      t.string :zipcode
      t.string :name
      t.string :city
    end 
  end 
end
