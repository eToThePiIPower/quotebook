require 'rails_helper'

RSpec.describe Api::V0::UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index, format: :json
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      user = create(:user)
      get :show, format: :json, params: { id: user.to_param }
      expect(response).to be_successful
    end
  end
end
