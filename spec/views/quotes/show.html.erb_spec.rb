require 'rails_helper'

RSpec.describe 'quotes/show', type: :view do
  before(:each) do
    @quote = assign(:quote, create(:quote))
  end

  it 'renders attributes in <p>' do
    render

    expect(rendered).to match @quote.text
    expect(rendered).to match @quote.source
  end
end
