json.extract! profile, :id, :username, :fullname, :bio, :user_id, :avatar, :created_at, :updated_at
json.url profile_url(profile, format: :json)
