class FoodBagBelongsToRecipient < ActiveRecord::Migration[6.0]
  def change
    add_column :foodbags, :recipient_id, :integer, foreign_key: true
  end
end
