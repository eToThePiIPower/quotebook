json.status 'success'
json.data do
  json.users do
    json.array! @users, partial: 'api/v0/users/nested', as: :user
  end
end
json.code 200
