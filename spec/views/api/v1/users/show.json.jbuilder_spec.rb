require 'rails_helper'

RSpec.describe 'api/v1/users/show', type: :view do
  before(:each) do
    @user = assign(:user, create(:user))
  end

  it 'renders status and code' do
    render
    user_hash = JSON.parse(rendered)

    expect(user_hash['status']).to eq 'success'
    expect(user_hash['code']).to eq 200
  end

  it 'renders the user as json' do
    render
    user_hash = JSON.parse(rendered)

    expect(user_hash['data']).to include(
      'id' => @user.id,
      'username' => @user.username,
      'about_me' => @user.profile.about_me,
      'location' => @user.profile.location,
      'home_page' => @user.profile.home_page
    )
    expect(user_hash['data']).to include(
      'created_at',
      'updated_at'
    )
  end

  it 'does not render user private attributes' do
    render
    user_hash = JSON.parse(rendered)

    expect(user_hash['data']).not_to include(
      'email',
      'password',
      'password_confirmation',
      'password_digest'
    )
  end
end
