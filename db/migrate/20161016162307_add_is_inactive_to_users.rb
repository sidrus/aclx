class AddIsInactiveToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :inactive, :boolean
  end

  def down
    remove_column :users, :inactive
  end
end
