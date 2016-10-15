class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :aclx_id
      t.boolean :id_issued
      t.string :forum_name
      t.string :full_name
      t.string :email
      t.string :vehicle_desc
      t.date :date_joined
      t.boolean :has_facebook
      t.text :comments
      t.date :last_activity

      t.timestamps
    end
  end
end