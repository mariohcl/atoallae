json.extract! event, :id, :user_id, :title, :description, :place, :date, :page_id, :created_at, :updated_at
json.url event_url(event, format: :json)
