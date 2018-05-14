require 'rails_helper'

RSpec.describe QuotesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Quote. As you add validations to Quote, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    attributes_for(:quote)
  end

  let(:invalid_attributes) do
    attributes_for(:quote, :invalid)
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      create(:quote)
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      quote = Quote.create! valid_attributes
      get :show, params: { id: quote.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, session: valid_session, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      quote = Quote.create! valid_attributes
      get :edit, session: valid_session, params: { id: quote.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Quote' do
        expect do
          post :create, session: valid_session,
                        params: { quote: valid_attributes }
        end.to change(Quote, :count).by(1)
      end

      it 'redirects to the created quote' do
        post :create, session: valid_session,
                      params: { quote: valid_attributes }
        expect(response).to redirect_to(Quote.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, session: valid_session,
                      params: { quote: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested quote' do
        quote = create(:quote, text: 'MyOldText')
        put :update, session: valid_session,
                     params: { id: quote.to_param, quote: { text: 'MyNewText' } }
        quote.reload
        expect(quote.text).to eq 'MyNewText'
      end

      it 'redirects to the quote' do
        quote = create(:quote)
        put :update, session: valid_session,
                     params: { id: quote.to_param, quote: valid_attributes }
        expect(response).to redirect_to(quote)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        quote = create(:quote)
        put :update, session: valid_session,
                     params: { id: quote.to_param, quote: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested quote' do
      quote = create(:quote)
      expect do
        delete :destroy, session: valid_session, params: { id: quote.to_param }
      end.to change(Quote, :count).by(-1)
    end

    it 'redirects to the quotes list' do
      quote = create(:quote)
      delete :destroy, session: valid_session, params: { id: quote.to_param }
      expect(response).to redirect_to(quotes_url)
    end
  end
end
