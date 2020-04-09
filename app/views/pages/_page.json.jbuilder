json.extract! page, :id, :name, :image, :cover, :bio, :user_id, :instagram, :facebook, :twitter, :created_at, :updated_at
json.url page_url(page, format: :json)
