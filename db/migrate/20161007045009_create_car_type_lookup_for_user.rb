class CreateCarTypeLookupForUser < ActiveRecord::Migration[5.0]
  def up
    create_table :car_types do |t|
      t.string :name
    end
    add_column :users, :type, :integer #Maybe put not_null constraints here.
  end

  def down
    remove_column :users, :car_type #Let's assume you have one of those now…
    remove_table :car_types
  end
end
