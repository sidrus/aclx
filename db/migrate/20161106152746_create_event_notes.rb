class CreateEventNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :event_notes do |t|
      t.string :title
      t.string :content
      t.references :admin, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
