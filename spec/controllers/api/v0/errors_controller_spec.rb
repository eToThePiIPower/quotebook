require 'rails_helper'

RSpec.describe Api::V0::ErrorsController, type: :controller do
  describe 'invalid_path' do
    it 'renders a json error' do
      get :invalid_path, format: :json, params: { path: 'fuzzbizz' }

      response_hash = JSON.parse(response.body)
      expect(response_hash['status']).to eq 'error'
      expect(response_hash['message']).to eq 'path not found'
      expect(response_hash['code']).to eq 4000
    end
  end
end
