require 'rails_helper'

RSpec.describe 'api/v0/users/index', type: :view do
  before(:each) do
    @users = assign(:users, [
      create(:user, username: 'User1'),
      create(:user, username: 'User2'),
    ])
  end

  it 'renders status and code' do
    render
    user_hash = JSON.parse(rendered)

    expect(user_hash['status']).to eq 'success'
    expect(user_hash['code']).to eq 200
  end

  it 'renders both of the users' do
    render
    users_hash = JSON.parse(rendered)

    expect(users_hash['data']['users'].count).to eq 2
  end

  it 'renders the users as json' do
    render
    users_hash = JSON.parse(rendered)

    expect(users_hash['data']['users'][0]).to include(
      'id' => @users[0].id,
    )
    expect(users_hash['data']['users'][1]).to include(
      'id' => @users[1].id,
    )
  end

  it 'has the correct data schema' do
    render
    users_hash = JSON.parse(rendered)

    expect(users_hash['data']['users'][0]).to include(
      'id', 'url',
      'username', 'gravatar'
    )
  end

  it 'does not render user private attributes' do
    render
    user_hash = JSON.parse(rendered)

    expect(user_hash['data']['users'][0]).not_to include(
      'email',
      'password',
      'password_confirmation',
      'password_digest',
    )
  end
end
