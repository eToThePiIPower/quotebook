require 'rails_helper'

RSpec.describe 'quotes/index', type: :view do
  before(:each) do
    @quotes = assign(:quotes, [
      create(:quote, text: 'MyText1'),
      create(:quote, text: 'MyText2')
    ])
  end

  it 'renders a list of quotes' do
    render

    expect(rendered).to match @quotes[0].text
    expect(rendered).to match @quotes[1].text
    expect(rendered).to match @quotes[0].source
    expect(rendered).to match @quotes[1].source
  end
end
