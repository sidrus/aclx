json.extract! user, :id, :id, :id_issued, :forum_name, :full_name, :email, :vehicle_desc, :date_joined, :has_facebook, :comments, :last_activity, :created_at, :updated_at
json.url user_url(user, format: :json)