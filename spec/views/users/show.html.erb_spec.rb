require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :view do
  before(:each) do
    @user = assign(:user, create(:user,
      username: 'MyName'))
  end

  it 'renders the profile card' do
    render

    expect(rendered).to have_selector 'h1.card-header', text: 'MyName'
    expect(rendered).to have_xpath(
      "//img[contains(@src, '#{gravatar_url(@user.email)}')]",
    )
  end

  it 'renders a list of quotes' do
    2.times { create(:quote, user: @user) }

    render

    expect(rendered).to have_selector '.list-group-item.index-quote', count: 2
  end

  context 'when the user has a profile set' do
    before(:each) do
      @profile = create(:profile, user: @user)
    end

    it 'renders the profile data' do
      render

      expect(rendered).to have_selector '.card-body',
        text: @profile.about_me
    end
  end
end
