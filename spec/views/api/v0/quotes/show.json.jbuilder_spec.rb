require 'rails_helper'

RSpec.describe 'api/v0/quotes/show', type: :view do
  before(:each) do
    @quote = assign(:quote, create(:quote))
  end

  it 'renders status and code' do
    render
    quote_hash = JSON.parse(rendered)

    expect(quote_hash['status']).to eq 'success'
    expect(quote_hash['code']).to eq 200
  end

  it 'renders the quote as json' do
    render
    quote_hash = JSON.parse(rendered)

    expect(quote_hash['data']).to include(
      'id' => @quote.id,
      'text' => @quote.text,
      'source' => @quote.source
    )
    expect(quote_hash['data']).to include(
      'created_at',
      'updated_at',
      'url',
      'user'
    )
  end

  it 'does not render user private attributes' do
    render
    quote_hash = JSON.parse(rendered)

    expect(quote_hash['data']['user']).not_to include(
      'email',
      'password',
      'password_confirmation',
      'password_digest'
    )
  end
end
