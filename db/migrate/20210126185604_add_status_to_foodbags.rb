class AddStatusToFoodbags < ActiveRecord::Migration[6.1]
  def change
    add_column :foodbags, :status, :integer
  end
end
