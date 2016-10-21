class CreateVehicleColors < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_colors do |t|
      t.string :name

      t.timestamps
    end
  end
end
