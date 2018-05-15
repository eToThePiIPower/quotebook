require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:quotes).dependent(:destroy) }

  it { should validate_length_of(:username).is_at_least(5) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username).case_insensitive }
end
