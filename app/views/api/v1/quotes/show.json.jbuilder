json.status 'success'
json.data do
  json.partial! 'api/v1/quotes/quote', quote: @quote
end
json.code 200
