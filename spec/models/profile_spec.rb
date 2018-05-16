require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:about_me) }
  it { should validate_length_of(:about_me).is_at_least(6) }

  it { should validate_length_of(:location).is_at_least(6) }
  it { should validate_length_of(:home_page).is_at_least(6) }
end
