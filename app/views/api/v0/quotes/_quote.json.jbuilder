json.extract! quote, :id, :text, :source, :created_at, :updated_at
json.user do
  json.partial! 'api/v0/users/nested', user: quote.user
end
json.url api_v0_quote_url(quote, format: :json)
