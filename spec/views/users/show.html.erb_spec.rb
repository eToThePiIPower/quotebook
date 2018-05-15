require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :view do
  before(:each) do
    @user = assign(:user, create(:user,
      username: 'MyName'))
  end

  it 'renders the profile card' do
    render

    expect(rendered).to have_selector 'h1.card-header', text: 'MyName'
    expect(rendered).to have_selector "img[src='#{gravatar_url(@user.email)}']"
  end
end
