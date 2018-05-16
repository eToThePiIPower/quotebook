json.extract! user, :id, :username, :created_at
json.about_me user.profile.about_me
json.location user.profile.location
json.home_page user.profile.home_page
json.url api_v0_user_url(user, format: :json)
