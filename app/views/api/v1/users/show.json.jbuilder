json.status 'success'
json.data do
  json.partial! 'api/v1/users/user', user: @user
end
json.code 200
