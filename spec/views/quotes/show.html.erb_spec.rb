require 'rails_helper'

RSpec.describe 'quotes/show', type: :view do
  before(:each) do
    @quote = assign(:quote, create(:quote))
    allow(view).to receive(:user_signed_in?).and_return(false)
  end

  it 'renders attributes in <p>' do
    render

    expect(rendered).to match @quote.text
    expect(rendered).to match @quote.source
  end

  it 'does not render action links' do
    render

    expect(rendered).not_to have_selector 'a', text: 'Edit'
    expect(rendered).not_to have_selector 'a', text: 'Delete'
  end

  context 'when the owner is signed in' do
    before(:each) do
      allow(view).to receive(:user_signed_in?).and_return(true)
      allow(view).to receive(:current_user).and_return(@quote.user)
    end

    it 'renders action links' do
      render

      expect(rendered).to have_selector 'a', text: 'Edit'
      expect(rendered).to have_selector 'a', text: 'Delete'
    end
  end
end
