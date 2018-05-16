json.status 'success'
json.data do
  json.partial! 'api/v0/quotes/quote', quote: @quote
end
json.code 200
