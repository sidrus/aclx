class AddYearToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :vehicle_year, :integer
  end
end
