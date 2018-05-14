require 'rails_helper'

RSpec.describe 'application/_navbar', type: :view do
  before(:each) do
    allow(view).to receive(:user_signed_in?).and_return(false)
  end

  it 'shows navigation links' do
    render

    expect(rendered).to have_selector '.nav-link', text: 'About'
    expect(rendered).to have_selector '.nav-link', text: 'Help'
  end

  context 'when a user is logged in' do
    before(:each) do
      @user = build(:user)
      allow(view).to receive(:user_signed_in?).and_return(true)
      allow(view).to receive(:current_user).and_return(@user)
    end

    it 'renders the user menu' do
      render

      expect(rendered).to have_selector '.dropdown-toggle', text: @user.username
      expect(rendered).to have_selector '.dropdown-item', text: 'Sign out'
      expect(rendered).to have_selector '.dropdown-item', text: 'Edit account'
    end
  end

  context 'when a user is not logged in' do
    it 'shows signin and signup buttons' do
      render

      expect(rendered).to have_selector '.nav-link', text: 'Sign in'
      expect(rendered).to have_selector '.btn.btn-outline-primary',
        text: 'Sign up'
    end
  end
end
