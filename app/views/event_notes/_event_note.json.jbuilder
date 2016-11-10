json.extract! event_note, :id, :title, :content, :admin_id, :event_id, :created_at, :updated_at
json.url event_note_url(event_note, format: :json)