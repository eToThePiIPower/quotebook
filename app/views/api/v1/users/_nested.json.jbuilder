json.extract! user, :id, :username
json.url api_v1_user_url(user, format: :json)
