require 'rails_helper'

RSpec.describe Quote, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:source) }
end
