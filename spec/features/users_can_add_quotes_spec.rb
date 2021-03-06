require 'rails_helper'

RSpec.feature 'the add quote process', type: :feature do
  include Warden::Test::Helpers
  context 'when logged in' do
    before(:each) do
      user = create(:user)
      login_as user
    end

    scenario 'adds a quote' do
      visit '/quotes/new'
      within('#quote-form') do
        fill_in 'Text', with: 'To be, or not to be. That is the question'
        fill_in 'Source', with: 'Romeo & Juliet'
      end
      click_button 'Submit'
      expect(page).to have_content 'Quote was successfully created'
    end
  end
end
