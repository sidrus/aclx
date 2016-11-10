json.extract! event, :id, :title, :location, :start, :end, :poc, :admin_id, :published, :created_at, :updated_at
json.url event_url(event, format: :json)