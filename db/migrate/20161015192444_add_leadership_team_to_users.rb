class AddLeadershipTeamToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :is_leadership, :boolean
  end

  def down
    remove_column :users, :is_leadership
  end
end
