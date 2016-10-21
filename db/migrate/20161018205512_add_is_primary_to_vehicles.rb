class AddIsPrimaryToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :is_primary, :boolean
  end
end
