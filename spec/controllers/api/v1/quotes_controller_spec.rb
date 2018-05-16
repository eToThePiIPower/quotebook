require 'rails_helper'

RSpec.describe Api::V1::QuotesController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index, format: :json
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      quote = create(:quote)
      get :show, format: :json, params: { id: quote.to_param }
      expect(response).to be_successful
    end
  end
end
