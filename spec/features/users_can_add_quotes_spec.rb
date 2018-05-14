require 'rails_helper'

RSpec.feature 'the add quote process', type: :feature do
  scenario 'adds a quote' do
    visit '/quotes/new'
    within('#quote') do
      fill_in 'Text', with: 'To be, or not to be. That is the question'
      fill_in 'Source', with: 'Romeo & Juliet'
    end
    click_button 'Submit'

    expect(page).to have_content 'Success'
  end
end
