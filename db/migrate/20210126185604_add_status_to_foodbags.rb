class AddStatusToFoodbags < ActiveRecord::Migration[6.0]
  def change
    add_column :foodbags, :status, :integer, default: 0
  end
end
