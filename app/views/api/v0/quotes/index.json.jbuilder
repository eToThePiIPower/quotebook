json.status 'success'
json.data do
  json.quotes do
    json.array! @quotes, partial: 'api/v0/quotes/quote', as: :quote
  end
end
json.code 200
