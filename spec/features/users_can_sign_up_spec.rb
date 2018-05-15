require 'rails_helper'

RSpec.feature 'the signup proces', type: :feature do
  scenario 'allows a user to sign up' do
    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'Email', with: 'user@exmample.com'
      fill_in 'Username', with: 'user@exmample.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'

      fill_in 'About me', with: 'I am Groot'
      fill_in 'Location', with: 'Somewhere'
      fill_in 'Home page', with: 'http://example.com'
    end
    click_button 'Sign up'

    expect(page).to have_content 'You have signed up successfully'
    expect(User.last.profile.about_me).to eq 'I am Groot'
  end
end
