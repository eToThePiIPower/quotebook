json.extract! quote, :id, :text, :source, :created_at, :updated_at
json.user do
  json.id quote.user.id
  json.username quote.user.username
end
json.url api_v1_quote_url(quote, format: :json)
