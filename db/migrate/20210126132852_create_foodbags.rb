class CreateFoodbags < ActiveRecord::Migration[6.0]
  def change
    create_table :foodbags do |t|

      t.timestamps
    end
  end
end
