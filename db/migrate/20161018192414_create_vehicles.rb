class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :nickname
      t.integer :user_id
      t.integer :color_id
      t.integer :edition_id
      t.integer :trim_id
      t.integer :model_id

      t.timestamps
    end
  end
end
