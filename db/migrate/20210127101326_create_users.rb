class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.integer :zipcode
      t.string :city
      t.integer :phonenumber

      t.timestamps
    end
  end
end
