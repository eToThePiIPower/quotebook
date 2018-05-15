require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'gravatar_url' do
    it 'returns a gravatar url for a user' do
      user = build(:user)

      expect(helper.gravatar_url(user.email)).to \
        match '^http://gravatar.com/avatar/[a-f0-9]{32}.png'
    end
  end
end
