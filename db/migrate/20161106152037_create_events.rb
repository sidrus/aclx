class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :start
      t.datetime :end
      t.integer :poc
      t.belongs_to :admin, foreign_key: true
      t.boolean :published

      t.timestamps
    end
  end
end
