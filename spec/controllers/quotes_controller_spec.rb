require 'rails_helper'

RSpec.describe QuotesController, type: :controller do
  let(:valid_attributes) do
    attributes_for(:quote)
  end

  let(:invalid_attributes) do
    attributes_for(:quote, :invalid)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      create(:quote)
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      quote = create(:quote)
      get :show, params: { id: quote.to_param }
      expect(response).to be_successful
    end
  end

  context 'when a user is signed in' do
    before(:each) do
      @user = create(:user)
      sign_in @user
    end

    describe 'GET #new' do
      it 'returns a success response' do
        get :new, params: {}
        expect(response).to be_successful
      end
    end

    describe 'GET #edit' do
      it 'returns a success response' do
        quote = create(:quote, user: @user)
        get :edit, params: { id: quote.to_param }
        expect(response).to be_successful
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new Quote' do
          expect do
            post :create, params: { quote: valid_attributes }
          end.to change(Quote, :count).by(1)
        end

        it 'redirects to the created quote' do
          post :create, params: { quote: valid_attributes }
          expect(response).to redirect_to(Quote.last)
        end
      end

      context 'with invalid params' do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: { quote: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        it 'updates the requested quote' do
          quote = create(:quote, user: @user, text: 'MyOldText')
          put :update, params: { id: quote.to_param, quote: { text: 'MyNewText' } }
          quote.reload
          expect(quote.text).to eq 'MyNewText'
        end

        it 'redirects to the quote' do
          quote = create(:quote, user: @user)
          put :update, params: { id: quote.to_param, quote: valid_attributes }
          expect(response).to redirect_to(quote)
        end
      end

      context 'with invalid params' do
        it "returns a success response (i.e. to display the 'edit' template)" do
          quote = create(:quote, user: @user)
          put :update, params: { id: quote.to_param, quote: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested quote' do
        quote = create(:quote, user: @user)
        expect do
          delete :destroy, params: { id: quote.to_param }
        end.to change(Quote, :count).by(-1)
      end

      it 'redirects to the quotes list' do
        quote = create(:quote, user: @user)
        delete :destroy, params: { id: quote.to_param }
        expect(response).to redirect_to(quotes_url)
      end
    end
  end

  context 'when another user is signed in' do
    before(:each) do
      @user = create(:user)
      sign_in @user
    end

    describe 'GET #edit' do
      it 'redirects to the quotes list' do
        quote = create(:quote)
        get :edit, params: { id: quote.to_param }
        expect(response).to redirect_to(quotes_url)
        expect(flash[:alert]).to match "Quote does not exist or you don't own it"
      end
    end

    describe 'PUT #update' do
      it 'does not updates the requested quote' do
        quote = create(:quote, text: 'MyOldText')
        put :update, params: { id: quote.to_param, quote: { text: 'MyNewText' } }
        quote.reload
        expect(quote.text).to eq 'MyOldText'
      end

      it 'redirects to the quotes list' do
        quote = create(:quote, text: 'MyOldText')
        put :update, params: { id: quote.to_param, quote: { text: 'MyNewText' } }
        expect(response).to redirect_to(quotes_url)
        expect(flash[:alert]).to match "Quote does not exist or you don't own it"
      end
    end

    describe 'DELETE #destroy' do
      it 'does not destroy the requested quote' do
        quote = create(:quote)
        expect do
          delete :destroy, params: { id: quote.to_param }
        end.not_to change(Quote, :count)
      end

      it 'redirects to the quotes list' do
        quote = create(:quote)
        delete :destroy, params: { id: quote.to_param }
        expect(response).to redirect_to(quotes_url)
        expect(flash[:alert]).to match "Quote does not exist or you don't own it"
      end
    end
  end

  context 'when a user is not signed in' do
    describe 'GET #new' do
      it 'redirects to the login page' do
        get :new, params: {}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'GET #edit' do
      it 'redirects to the login page' do
        quote = create(:quote)
        get :edit, params: { id: quote.to_param }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'POST #create' do
      it 'does not creates a new Quote' do
        expect do
          post :create, params: { quote: valid_attributes }
        end.not_to change(Quote, :count)
      end

      it 'redirects to the login page' do
        post :create, params: { quote: valid_attributes }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'PUT #update' do
      it 'does not updates the requested quote' do
        quote = create(:quote, text: 'MyOldText')
        put :update, params: { id: quote.to_param, quote: { text: 'MyNewText' } }
        quote.reload
        expect(quote.text).to eq 'MyOldText'
      end

      it 'redirects to the login page' do
        quote = create(:quote)
        put :update, params: { id: quote.to_param, quote: valid_attributes }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'DELETE #destroy' do
      it 'does not destroys the requested quote' do
        quote = create(:quote)
        expect do
          delete :destroy, params: { id: quote.to_param }
        end.not_to change(Quote, :count)
      end

      it 'redirects to the quotes list' do
        quote = create(:quote)
        delete :destroy, params: { id: quote.to_param }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
