class AddPickuptimeToFoodbags < ActiveRecord::Migration[6.0]
  def change
    add_column :foodbags, :pickuptime, :integer
  end
end
