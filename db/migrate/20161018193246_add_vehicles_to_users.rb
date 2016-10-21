class AddVehiclesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :vehicle, foreign_key: true
  end
end