require 'rails_helper'

RSpec.describe Api::V0::ErrorsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v0/fizzbuzz')
        .to route_to('api/v0/errors#invalid_path', format: :json, path: 'fizzbuzz')
    end
  end
end
