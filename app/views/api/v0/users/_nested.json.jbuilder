json.extract! user, :id, :username
json.url api_v0_user_url(user, format: :json)
