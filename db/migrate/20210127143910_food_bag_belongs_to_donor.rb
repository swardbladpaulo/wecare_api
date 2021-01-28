class FoodBagBelongsToDonor < ActiveRecord::Migration[6.0]
  def change
    add_column :foodbags, :donor_id, :integer, null: false, foreign_key: true
  end
end
