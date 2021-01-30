class AddProfilePageAttributes < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.string :adress
      t.integer :zipcode
      t.string :company_name
      t.string :city
    end
  end
end
