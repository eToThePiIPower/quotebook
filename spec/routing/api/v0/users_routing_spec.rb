require 'rails_helper'

RSpec.describe Api::V0::QuotesController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/api/v0/users/1')
        .to route_to('api/v0/users#show', id: '1', format: :json)
    end

    it 'routes to #index' do
      expect(get: '/api/v0/users')
        .to route_to('api/v0/users#index', format: :json)
    end
  end
end
