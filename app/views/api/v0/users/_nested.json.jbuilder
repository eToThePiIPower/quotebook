json.extract! user, :id, :username
json.gravatar gravatar_url(user.email)
json.url api_v0_user_url(user, format: :json)
