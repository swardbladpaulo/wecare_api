class AddPickuptimeToFoodbags < ActiveRecord::Migration[6.1]
  def change
    add_column :foodbags, :pickuptime, :integer
  end
end
