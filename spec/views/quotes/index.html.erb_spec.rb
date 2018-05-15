require 'rails_helper'

RSpec.describe 'quotes/index', type: :view do
  before(:each) do
    @quotes = assign(:quotes, [
      create(:quote, text: 'MyText1'),
      create(:quote, text: 'MyText2')
    ])
    allow(view).to receive(:user_signed_in?).and_return(false)
  end

  it 'renders a list of quotes' do
    render

    expect(rendered).to match @quotes[0].text
    expect(rendered).to match @quotes[1].text
    expect(rendered).to match @quotes[0].source
    expect(rendered).to match @quotes[1].source
  end

  it 'does not render a new quote button' do
    render

    expect(rendered).not_to have_selector 'a.btn', text: 'New Quote'
  end

  context 'when a user is signed in' do
    before(:each) do
      allow(view).to receive(:user_signed_in?).and_return(true)
    end

    it 'renders a new quote button' do
      render

      expect(rendered).to have_selector 'a.btn', text: 'New Quote'
    end
  end
end
