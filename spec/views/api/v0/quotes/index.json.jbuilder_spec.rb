require 'rails_helper'

RSpec.describe 'api/v0/quotes/index', type: :view do
  before(:each) do
    @quotes = assign(:quotes, [
      create(:quote, text: 'MyText1'),
      create(:quote, text: 'MyText2')
    ])
  end

  it 'renders status and code' do
    render
    quote_hash = JSON.parse(rendered)

    expect(quote_hash['status']).to eq 'success'
    expect(quote_hash['code']).to eq 200
  end

  it 'renders both of the quotes' do
    render
    quotes_hashes = JSON.parse(rendered)

    expect(quotes_hashes['data']['quotes'].count).to eq 2
  end

  it 'renders the quotes as json' do
    render
    quotes_hashes = JSON.parse(rendered)

    expect(quotes_hashes['data']['quotes'][0]).to include(
      'id' => @quotes[0].id,
      'text' => @quotes[0].text,
      'source' => @quotes[0].source
    )
  end

  it 'has the correct data schema' do
    render
    quotes_hashes = JSON.parse(rendered)

    expect(quotes_hashes['data']['quotes'][0]).to include(
      'id', 'created_at', 'updated_at', 'url',
      'text', 'source',
      'user'
    )
    expect(quotes_hashes['data']['quotes'][0]['user']).to include(
      'id', 'url',
      'username', 'gravatar'
    )
  end
end
